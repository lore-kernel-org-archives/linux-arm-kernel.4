Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81013606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 10:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4xhKWKER;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PA3h6R6d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6Bx6aGWAfxN03v1MCMPsA0sS0oGqYFrxfyvjdLje8lg=; b=4xhKWKERjFP/cYZr/C8GY6gtNY
	Lv5nifiuFS46EYVvcgMZzI7rUyFOEDkaz8tw6vjLdX3nouX1gn90Erm0rq5am/cKP/QMt2cLgR4d4
	6I4C6xIzUEuvjufDl3y6J3drYDjyqvhhg4Fdg6mYGtXoivIV+K8LNeO6io7a0aTJJTUOgku5s6hPa
	JI3scVNmccMZSaOhqgjdA2C4xtG/kXh5V+SBRSpgGqrj6xYU+BRpDRepPCLJcKpA4o5rJsoqpWh6y
	2X36GByS/q/rPHQjrgN0Ie6oNpfybiSjYaH50MFQaWigwxj8kmitxNwdupPEFhfPp2J5f0kv63VFp
	/r2ncRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGel-00000005JiR-24DA;
	Tue, 17 Nov 2026 10:43:19 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGei-00000005Jhg-3PhU;
	Tue, 17 Nov 2026 10:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794912197; x=1826448197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f+rZ70jL9NuYsutro/ekKRtcwGGOxbC6WYytJj8x+/8=;
  b=PA3h6R6d/VRwHZrSA3hU2ErZ+cR1nv3MLnk43Q3GimPsiWDVx2irWz1d
   +u7nzZkTdWPf71gh0ZMhNJioX/DKZVPAaja6FO4YVcL3ASa8M4tB7faAU
   Yr4SghX6FY/vJnmSFpFhYPLPulU7ehYoKg4j7ph5d44f8xQAwgRjMzryv
   aDhr0ZOFBEG0Y3PGKrElc3LyRMluYujZrgswP0t5jZUdCb9Y9xJsPSqMI
   GfUgEfJbzbd3/DlbqE5ayhWhakCn8P4wnGSCEY3mkFTcvIgm2ZJEXUtTc
   XR2xdcngyOp/exXwiYeepbcKDOZ1Y29LhpJb7fkYOsdK5M4HwyezdA5NQ
   g==;
X-CSE-ConnectionGUID: qG50XwJ3S9SqU+NepbOaGA==
X-CSE-MsgGUID: tSfnXxKRTpyrz3eiSThY9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3600971"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3600971"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 02:43:16 -0800
X-CSE-ConnectionGUID: Nzqs3jYXS5GkPf0gSVdZKA==
X-CSE-MsgGUID: 3cq5BzNoSAaTy3999ZO3ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9742331"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2026 02:43:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 22A2C99; Tue, 17 Nov 2026 11:43:12 +0100 (CET)
Date: Tue, 17 Nov 2026 11:43:12 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: aiyengar1990@gmail.com
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/2] usb: typec: fusb302: Toggle with the default Rp
 current
Message-ID: <avwvwBLFBHCc36dc@black.igk.intel.com>
References: <20261112-tcpm-attach-reboot-v2-0-b4bc6ca83490@gmail.com>
 <20261112-tcpm-attach-reboot-v2-2-b4bc6ca83490@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-tcpm-attach-reboot-v2-2-b4bc6ca83490@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_024316_866475_27C3C885 
X-CRM114-Status: GOOD (  29.71  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 08:23:34AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> tcpm_start_toggling() programs the Rp current that tcpm asks for, which
> is the current of the source PDO (Rp 3.0A on boards that can source
> 3A) when the port starts toggling from Unattached.SRC, and the default
> current when it starts from Unattached.SNK after a detach.
> 
> A Genesys Logic based USB-C to DisplayPort cable connected to the
> Orange Pi 5 is often not detected after a warm reboot: the FUSB302
> toggle state machine raises no interrupt with it while it drives the
> high Rp current, but finds it within seconds once toggling restarts
> with the default current after another device was detached.
> 
> Toggle with the default current, and switch to the requested one when
> toggling stops on a sink, before tcpm is told about the attach, so the
> sink sees the configured level from the start of the connection as
> before. tcpm does not set it again after attach on every path (not on
> ports without PD, for instance). The Rd detection threshold used for
> unplug detection follows the restored current.
> 
> The FUSB302B datasheet sets the toggle up the same way: under "Toggle
> Functionality" the processor writes HOST_CUR for the default current
> before it sets TOGGLE, and a HOST_CUR change after attach is applied to
> the CC line immediately ("HOST_CUR Changed After Attach").
> 
> Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Looks okay to me, but you need to CC stable:
https://docs.kernel.org/process/submitting-patches.html#select-the-recipients-for-your-patch

But let's wait for comments from Badhri to the tcpm patch.

Thanks,

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 3319f6a2b0c9..44aa05fd4ba2 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -97,6 +97,7 @@ struct fusb302_chip {
>  	/* chip status */
>  	enum toggling_mode toggling_mode;
>  	enum src_current_status src_current_status;
> +	enum src_current_status toggling_src_current;
>  	bool intr_togdone;
>  	bool intr_bc_lvl;
>  	bool intr_comp_chng;
> @@ -942,10 +943,19 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
>  	}
>  
>  	mutex_lock(&chip->lock);
> -	ret = fusb302_set_src_current(chip, cc_src_current[cc]);
> +	/*
> +	 * Look for a partner with the default USB current advertisement.
> +	 * Some sinks (seen with a Genesys Logic based USB-C to DisplayPort
> +	 * cable) present an Rd that the FUSB302 toggle state machine does
> +	 * not detect while it drives the high (3.0 A) Rp current, so they
> +	 * are only found when toggling starts from the sink side. The
> +	 * requested current is restored when toggling finds a sink.
> +	 */
> +	chip->toggling_src_current = cc_src_current[cc];
> +	ret = fusb302_set_src_current(chip, SRC_CURRENT_DEFAULT);
>  	if (ret < 0) {
>  		fusb302_log(chip, "unable to set src current %s, ret=%d",
> -			    typec_cc_status_name[cc], ret);
> +			    typec_cc_status_name[TYPEC_CC_RP_DEF], ret);
>  		goto done;
>  	}
>  	ret = fusb302_set_toggling(chip, mode);
> @@ -1357,6 +1367,13 @@ static int fusb302_handle_togdone_src(struct fusb302_chip *chip,
>  			    typec_cc_status_name[cc2]);
>  		return fusb302_set_toggling(chip, toggling_mode);
>  	}
> +	/* advertise the requested Rp current now that a sink is attached */
> +	ret = fusb302_set_src_current(chip, chip->toggling_src_current);
> +	if (ret < 0) {
> +		fusb302_log(chip, "cannot set src current, ret=%d", ret);
> +		return ret;
> +	}
> +	rd_mda = rd_mda_value[chip->src_current_status];
>  	/* set polarity and pull_up, pull_down */
>  	ret = fusb302_set_cc_polarity_and_pull(chip, cc_polarity, true, false);
>  	if (ret < 0) {
> 
> -- 
> 2.55.0
> 

-- 
heikki

