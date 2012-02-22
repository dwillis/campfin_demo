class FecFilingsController < ApplicationController

  def index
    @fec_filings = Filing.today.select{|f| f.form_type == 'F3' && !f.original_filing.nil?}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @fec_filings }
    end
  end
  
  def grassroots
    ids = President.summary.collect{|c| c.committee_id}
    @details = ids.map{|id| President.detail(id, 2012)}
  end
  
  def compare
    original = Fech::Filing.new(params[:original])
    updated = Fech::Filing.new(params[:updated])
    original.download
    updated.download
    @original_filing = params[:original]
    @updated_filing = params[:updated]
    @original = original.summary
    @updated = updated.summary
    raise ActiveRecord::NotFound if @original[:filer_committee_id_number] != @updated[:filer_committee_id_number]
    @diff = @updated.diff(@original).keys.select{|k| k.to_s.first(4) == 'col_'}
  end
  
  
  def fech
    @filing_id = params[:id]
    filing = Fech::Filing.new(@filing_id)
    filing.download
    @summary = filing.summary
    @contribs = filing.rows_like(/^sb23/)
  end

  # GET /fec_filings/1
  # GET /fec_filings/1.json
  def show
    @fec_filing = FecFiling.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @fec_filing }
    end
  end

  # GET /fec_filings/new
  # GET /fec_filings/new.json
  def new
    @fec_filing = FecFiling.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @fec_filing }
    end
  end

  # GET /fec_filings/1/edit
  def edit
    @fec_filing = FecFiling.find(params[:id])
  end

  # POST /fec_filings
  # POST /fec_filings.json
  def create
    @fec_filing = FecFiling.new(params[:fec_filing])

    respond_to do |format|
      if @fec_filing.save
        format.html { redirect_to @fec_filing, :notice => 'Fec filing was successfully created.' }
        format.json { render :json => @fec_filing, :status => :created, :location => @fec_filing }
      else
        format.html { render :action => "new" }
        format.json { render :json => @fec_filing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fec_filings/1
  # PUT /fec_filings/1.json
  def update
    @fec_filing = FecFiling.find(params[:id])

    respond_to do |format|
      if @fec_filing.update_attributes(params[:fec_filing])
        format.html { redirect_to @fec_filing, :notice => 'Fec filing was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @fec_filing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fec_filings/1
  # DELETE /fec_filings/1.json
  def destroy
    @fec_filing = FecFiling.find(params[:id])
    @fec_filing.destroy

    respond_to do |format|
      format.html { redirect_to fec_filings_url }
      format.json { head :ok }
    end
  end
end
