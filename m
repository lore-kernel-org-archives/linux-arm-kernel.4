Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E432A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JLAwBZ9B;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mBiWocXT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r0jRB2J8ubwFVU/YQIH/MJ240voC8y3O2436mW3KOh8=; b=JLAwBZ9BH6wM8YCfMiEIL1X1Ay
	EXqU8NuMhRW89bvJrdNHW61MOPSxqxBulqelRz16JzJ0ZWBYKQ8ZOFAey9VMSP2+mXnM8YbVopUsJ
	m0KNzxtTiIkQ2IZEbdWps4IVQyUcvtvcYwea+Vav3v7E8WaNfNy7wByNWF2GE+LD1WyvnrF+7KwDQ
	E7WIuoJmaiwIy1XrzJF8eLQ34lSxVf8Ajb2HQdmgRJks10KxqiohQVn8FgwQCewisFX57nyf0fp1v
	dS1PL11TdrvJWLIAAKftuwsqqpsPL/KBHukkgO9tRiWFmLEd/s+UYNWJdhi2z81uxl06ZomG5ftTL
	6QaL2V5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPix-000000070Kt-08rA;
	Tue, 17 Nov 2026 20:24:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPit-000000070JC-0RWw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 20:24:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 409DF339;
	Tue, 17 Nov 2026 12:24:07 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BB463F632;
	Tue, 17 Nov 2026 12:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794947050; bh=Kn012aeDhW2fcEa8v+QaWmRsPbxu0WrxOyxXUiRCe4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBiWocXTEBAT1YitkIx0u7arVpmF5DcB1R/4jr6E+9d0EsXmqeS429Wc2oYN/MPtf
	 WCyFop5pr473hXQi/9aJyx9Iyay+LriqfFWqeE2CxVJL+o6GQTOfufB97XYjoXFpko
	 HDqnT43RGck+16MPa+b7gu6dbNgCWsNKefGmvFxU=
Date: Tue, 17 Nov 2026 20:24:05 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>, apais@microsoft.com,
	rachelmenge@linux.microsoft.com, hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] tpm: tpm_crb: Use cached tpm2_acpi_start_method
Message-ID: <avy35Wrw7Riz9olR@e129823.arm.com>
References: <20261115013456.212141-1-sidchintamaneni@gmail.com>
 <20261115013456.212141-5-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115013456.212141-5-sidchintamaneni@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_122411_266846_C1856D5A 
X-CRM114-Status: GOOD (  28.86  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LGTM.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Sun, Nov 15, 2026 at 01:34:56AM +0000, Siddharth Chintamaneni wrote:
> Replace priv->sm and the local sm variable in crb_acpi_probe() with
> tpm2_acpi_start_method across tpm_crb so the cached global serves as
> the single source for the ACPI TPM2 start method.
> 
> Check tpm2_acpi_start_method at the start of crb_acpi_probe() and
> return -ENODEV before mapping the ACPI TPM2 table when the table is
> absent or uses ACPI_TPM2_MEMORY_MAPPED.
> 
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> ---
>  drivers/char/tpm/tpm_crb.c | 82 ++++++++++++++++++--------------------
>  1 file changed, 38 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
> index 4749a9183726..8585c73fb25b 100644
> --- a/drivers/char/tpm/tpm_crb.c
> +++ b/drivers/char/tpm/tpm_crb.c
> @@ -98,7 +98,6 @@ enum crb_status {
>  };
>  
>  struct crb_priv {
> -	u32 sm;
>  	const char *hid;
>  	struct crb_regs_head __iomem *regs_h;
>  	struct crb_regs_tail __iomem *regs_t;
> @@ -138,11 +137,11 @@ struct tpm2_crb_pluton {
>  /*
>   * Returns true if the start method supports idle.
>   */
> -static inline bool tpm_crb_has_idle(u32 start_method)
> +static inline bool tpm_crb_has_idle(void)
>  {
> -	return !(start_method == ACPI_TPM2_START_METHOD ||
> -	       start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD ||
> -	       start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC);
> +	return !(tpm2_acpi_start_method == ACPI_TPM2_START_METHOD ||
> +		 tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD ||
> +		 tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC);
>  }
>  
>  static bool crb_wait_for_reg_32(u32 __iomem *reg, u32 mask, u32 value,
> @@ -166,7 +165,7 @@ static bool crb_wait_for_reg_32(u32 __iomem *reg, u32 mask, u32 value,
>  
>  static int crb_try_pluton_doorbell(struct crb_priv *priv, bool wait_for_complete)
>  {
> -	if (priv->sm != ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON)
> +	if (tpm2_acpi_start_method != ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON)
>  		return 0;
>  
>  	if (!crb_wait_for_reg_32(priv->pluton_reply_addr, ~0, 1, TPM2_TIMEOUT_C))
> @@ -204,12 +203,12 @@ static int __crb_go_idle(struct device *dev, struct crb_priv *priv, int loc)
>  {
>  	int rc;
>  
> -	if (!tpm_crb_has_idle(priv->sm))
> +	if (!tpm_crb_has_idle())
>  		return 0;
>  
>  	iowrite32(CRB_CTRL_REQ_GO_IDLE, &priv->regs_t->ctrl_req);
>  
> -	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
> +	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
>  		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_COMMAND, loc);
>  		if (rc)
>  			return rc;
> @@ -258,12 +257,12 @@ static int __crb_cmd_ready(struct device *dev, struct crb_priv *priv, int loc)
>  {
>  	int rc;
>  
> -	if (!tpm_crb_has_idle(priv->sm))
> +	if (!tpm_crb_has_idle())
>  		return 0;
>  
>  	iowrite32(CRB_CTRL_REQ_CMD_READY, &priv->regs_t->ctrl_req);
>  
> -	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
> +	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
>  		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_COMMAND, loc);
>  		if (rc)
>  			return rc;
> @@ -303,7 +302,7 @@ static int __crb_request_locality(struct device *dev,
>  
>  	iowrite32(CRB_LOC_CTRL_REQUEST_ACCESS, &priv->regs_h->loc_ctrl);
>  
> -	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
> +	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
>  		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_LOCALITY_REQUEST, loc);
>  		if (rc)
>  			return rc;
> @@ -337,7 +336,7 @@ static int __crb_relinquish_locality(struct device *dev,
>  
>  	iowrite32(CRB_LOC_CTRL_RELINQUISH, &priv->regs_h->loc_ctrl);
>  
> -	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
> +	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
>  		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_LOCALITY_REQUEST, loc);
>  		if (rc)
>  			return rc;
> @@ -530,18 +529,18 @@ static int tpm_crb_start(struct tpm_chip *chip, u32 start_cmd)
>  	 * report only ACPI start but in practice seems to require both
>  	 * CRB start, hence invoking CRB start method if hid == MSFT0101.
>  	 */
> -	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER ||
> -	    priv->sm == ACPI_TPM2_MEMORY_MAPPED ||
> +	if (tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER ||
> +	    tpm2_acpi_start_method == ACPI_TPM2_MEMORY_MAPPED ||
>  	    !strcmp(priv->hid, "MSFT0101"))
>  		iowrite32(start_cmd, &priv->regs_t->ctrl_start);
> -	if (priv->sm == ACPI_TPM2_START_METHOD ||
> -	    priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD)
> +	if (tpm2_acpi_start_method == ACPI_TPM2_START_METHOD ||
> +	    tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD)
>  		rc = crb_do_acpi_start(chip);
> -	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC) {
> +	if (tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC) {
>  		iowrite32(start_cmd, &priv->regs_t->ctrl_start);
>  		rc = tpm_crb_smc_start(&chip->dev, priv->smc_func_id);
>  	}
> -	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
> +	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
>  		iowrite32(start_cmd, &priv->regs_t->ctrl_start);
>  		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_COMMAND, chip->locality);
>  	}
> @@ -622,7 +621,7 @@ static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
>  	}
>  
>  	/* Seems to be necessary for every command */
> -	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON)
> +	if (tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON)
>  		__crb_cmd_ready(&chip->dev, priv, chip->locality);
>  
>  	if (len <= priv->cmd_size)
> @@ -638,12 +637,12 @@ static void crb_cancel(struct tpm_chip *chip)
>  
>  	iowrite32(CRB_CANCEL_INVOKE, &priv->regs_t->ctrl_cancel);
>  
> -	if ((priv->sm == ACPI_TPM2_START_METHOD ||
> -	     priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD) &&
> -	     crb_do_acpi_start(chip))
> +	if ((tpm2_acpi_start_method == ACPI_TPM2_START_METHOD ||
> +	     tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD) &&
> +	    crb_do_acpi_start(chip))
>  		dev_err(&chip->dev, "ACPI Start failed\n");
>  
> -	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
> +	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
>  		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_COMMAND, chip->locality);
>  		if (rc)
>  			dev_err(&chip->dev, "FF-A Start failed\n");
> @@ -762,7 +761,7 @@ static int crb_map_io(struct device *dev, struct crb_priv *priv,
>  	 * Pluton sometimes does not define ACPI memory regions.
>  	 * Mapping is then done in crb_map_pluton
>  	 */
> -	if (priv->sm != ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON) {
> +	if (tpm2_acpi_start_method != ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON) {
>  		INIT_LIST_HEAD(&acpi_resource_list);
>  		ret = acpi_dev_get_resources(device, &acpi_resource_list,
>  					     crb_check_resource, iores_array);
> @@ -804,9 +803,9 @@ static int crb_map_io(struct device *dev, struct crb_priv *priv,
>  	 * the control area, as one nice sane region except for some older
>  	 * stuff that puts the control area outside the ACPI IO region.
>  	 */
> -	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER ||
> -	    priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA ||
> -	    priv->sm == ACPI_TPM2_MEMORY_MAPPED) {
> +	if (tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER ||
> +	    tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA ||
> +	    tpm2_acpi_start_method == ACPI_TPM2_MEMORY_MAPPED) {
>  		if (iores &&
>  		    buf->control_address == iores->start +
>  		    sizeof(*priv->regs_h))
> @@ -938,25 +937,21 @@ static int crb_acpi_probe(struct platform_device *pdev)
>  	struct tpm2_crb_ffa *crb_ffa;
>  	struct tpm2_crb_pluton *crb_pluton;
>  	acpi_status status;
> -	u32 sm;
>  	int rc;
>  
>  	device = ACPI_COMPANION(dev);
>  	if (!device)
>  		return -ENODEV;
>  
> -	status = acpi_get_table(ACPI_SIG_TPM2, 1,
> -				(struct acpi_table_header **) &buf);
> -	if (ACPI_FAILURE(status) || buf->header.length < sizeof(*buf)) {
> -		dev_err(dev, FW_BUG "failed to get TPM2 ACPI table\n");
> -		return -EINVAL;
> -	}
> +	if (tpm2_acpi_start_method == ACPI_TPM2_NOT_ALLOWED ||
> +	    tpm2_acpi_start_method == ACPI_TPM2_MEMORY_MAPPED)
> +		return -ENODEV;
>  
> -	/* Should the FIFO driver handle this? */
> -	sm = buf->start_method;
> -	if (sm == ACPI_TPM2_MEMORY_MAPPED) {
> -		rc = -ENODEV;
> -		goto out;
> +	status = acpi_get_table(ACPI_SIG_TPM2, 1, (typeof(buf->header) **)&buf);
> +	if (ACPI_FAILURE(status) || buf->header.length < sizeof(*buf)) {
> +		if (ACPI_SUCCESS(status))
> +			acpi_put_table((struct acpi_table_header *)buf);
> +		return -ENODEV;
>  	}
>  
>  	priv = devm_kzalloc_obj(dev, struct crb_priv);
> @@ -965,7 +960,7 @@ static int crb_acpi_probe(struct platform_device *pdev)
>  		goto out;
>  	}
>  
> -	if (sm == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC) {
> +	if (tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC) {
>  		if (buf->header.length < (sizeof(*buf) + sizeof(*crb_smc))) {
>  			dev_err(dev,
>  				FW_BUG "TPM2 ACPI table has wrong size %u for start method type %d\n",
> @@ -978,7 +973,7 @@ static int crb_acpi_probe(struct platform_device *pdev)
>  		priv->smc_func_id = crb_smc->smc_func_id;
>  	}
>  
> -	if (sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
> +	if (tpm2_acpi_start_method == ACPI_TPM2_CRB_WITH_ARM_FFA) {
>  		if (buf->header.length < (sizeof(*buf) + sizeof(*crb_ffa))) {
>  			dev_err(dev,
>  				FW_BUG "TPM2 ACPI table has wrong size %u for start method type %d\n",
> @@ -999,7 +994,7 @@ static int crb_acpi_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	if (sm == ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON) {
> +	if (tpm2_acpi_start_method == ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON) {
>  		if (buf->header.length < (sizeof(*buf) + sizeof(*crb_pluton))) {
>  			dev_err(dev,
>  				FW_BUG "TPM2 ACPI table has wrong size %u for start method type %d\n",
> @@ -1014,7 +1009,6 @@ static int crb_acpi_probe(struct platform_device *pdev)
>  			goto out;
>  	}
>  
> -	priv->sm = sm;
>  	priv->hid = acpi_device_hid(device);
>  
>  	rc = crb_map_io(dev, priv, buf);
> @@ -1038,7 +1032,7 @@ static int crb_acpi_probe(struct platform_device *pdev)
>  #ifdef CONFIG_X86
>  	/* A quirk for https://www.amd.com/en/support/kb/faq/pa-410 */
>  	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
> -	    priv->sm != ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON) {
> +	    tpm2_acpi_start_method != ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON) {
>  		dev_info(dev, "Disabling hwrng\n");
>  		chip->flags |= TPM_CHIP_FLAG_HWRNG_DISABLED;
>  	}
> -- 
> 2.45.4
> 

-- 
Sincerely,
Yeoreum Yun

