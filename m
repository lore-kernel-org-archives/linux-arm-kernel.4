Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC08F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 06:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W1m1wPES;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=nAKa9CPq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+LkSY5GlXR1Cv2REFbi0XBAyEkYgGEsqiwtvr/sPn20=; b=W1m1wPESyQoLTDsWapquSxJuKU
	/kFH3cM33Un13qoHCs8S2YYgdklXY9CGKbIm8UqvDcDMhHQresydpzNJj0cwYwenh/mklJ+fk8oO7
	fgsgfoHW7vfFqAx+0+4hiBpCLdvPL1ArNn83TiVfHu8LWSCb0yhaVH2tTyvoKX1GRdHVyhfs5G9bB
	zRVW/ASXc0APqsvJN7WvlyIuN/7tJA1YjcZhBRq0a4BadTULXb46O63sWsc079JtFC8OGQqQbKnnD
	/JG89lnLvt9iQ3WM04ORLjcJu/vTnY4wpdpkb1io6OLsBydDXvxJcWZIfawRBcnB6ePRzdVcw3WG2
	x99esmXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZF4-00000007ubT-0EQn;
	Wed, 18 Nov 2026 06:34:02 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZF0-00000007ub9-35RE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 06:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+LkSY5GlXR1Cv2REFbi0XBAyEkYgGEsqiwtvr/sPn20=; t=1794983638; x=1795847638; 
	b=nAKa9CPql0z+1sMynzYMl8vekukgptl7utHFq5cKufEkBl/0vDkjijQJqZn6KgpgsQymqtpmM0q
	vw2xaH7w9B83apDnI3EjxYxL3BsAzXqzTDVB6yJpLraDtAd7yl6B9Qv5jjjYhD6p4yoFtUnCxF0Si
	/pA8yceNqqcdsMDEZlHGX6hTW5HKQM9+W8+WrGqqNXYM+/bnYT/SExyBsCXUkd9ZZakQxjoi5CM7U
	2j55xEuXZW5oIP98+aH7uiJ2AFRU2U/W4seAMrVbLiPAd7XX5MUXzNVDeoxsqKh68OVmUPuPw5FPE
	6wA0ILMQKg1Qpt5K7vdNoIAnikC+zjo8BnLg==;
Received: from [167.220.238.88] (helo=csail.mit.edu)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xTZEw-00EuZP-Ef;
	Wed, 18 Nov 2026 01:33:54 -0500
Date: Wed, 18 Nov 2026 12:03:46 +0530
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: tgopinath@linux.microsoft.com, ssengar@linux.microsoft.com,
	michal.simek@amd.com, rajan.vaja@xilinx.com, tejas.patel@xilinx.com,
	abhyuday.godhasara@xilinx.com, gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de
Subject: Re: [PATCH 2/2] soc: xilinx: Fix event manager CPU hotplug state
 cleanup
Message-ID: <av1GyoUdnxMV_C2p@csail.mit.edu>
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
 <20261103063515.679043-1-ptsm@linux.microsoft.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103063515.679043-1-ptsm@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_223358_948626_25FADD25 
X-CRM114-Status: GOOD (  22.44  )
X-Spam-Score: -1.9 (-)
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

On Mon, Nov 02, 2026 at 10:35:15PM -0800, Prasanna Kumar T S M wrote:
> On driver removal, the event manager removes the CPUHP_AP_ONLINE_DYN
> CPU hotplug state instead of the its actual state. This can leave the
> event manager callbacks dangling. Use the actual CPU hotplug state
> during driver removal.
> 
> Hotplug registration failures are also ignored, allowing probe to
> succeed without the callbacks needed to enable event interrupts on
> CPUs brought online later.
> 
> Fixes: c7fdb2404f66 ("drivers: soc: xilinx: add xilinx event management driver")
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>  drivers/soc/xilinx/xlnx_event_manager.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/xilinx/xlnx_event_manager.c b/drivers/soc/xilinx/xlnx_event_manager.c
> index f733dc42b3b1..2d8bfeab4190 100644
> --- a/drivers/soc/xilinx/xlnx_event_manager.c
> +++ b/drivers/soc/xilinx/xlnx_event_manager.c
> @@ -24,6 +24,7 @@ static DEFINE_PER_CPU_READ_MOSTLY(int, dummy_cpu_number);
>  
>  static int virq_sgi;
>  static int event_manager_availability = -EACCES;
> +static enum cpuhp_state hp_state;
>  
>  /* SGI number used for Event management driver */
>  #define XLNX_EVENT_SGI_NUM	(15)
> @@ -625,8 +626,6 @@ static int xlnx_event_init_sgi(struct platform_device *pdev)
>  
>  static void xlnx_event_cleanup_sgi(struct platform_device *pdev)
>  {
> -	cpuhp_remove_state(CPUHP_AP_ONLINE_DYN);
> -
>  	on_each_cpu(xlnx_disable_percpu_irq, NULL, 1);
>  
>  	irq_clear_status_flags(virq_sgi, IRQ_PER_CPU);
> @@ -660,8 +659,13 @@ static int xlnx_event_manager_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Setup function for the CPU hot-plug cases */
> -	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/event:starting",
> -			  xlnx_event_cpuhp_start, xlnx_event_cpuhp_down);
> +	hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +			"soc/event:starting", xlnx_event_cpuhp_start,

Let's change :starting to :online as per convention, as this is
associated with the ONLINE_DYN state.

Can we also edit the callback names for symmetry similar to the
suggestion for patch 1/2?

> +			xlnx_event_cpuhp_down);
> +	if (hp_state < 0) {
> +		xlnx_event_cleanup_sgi(pdev);
> +		return hp_state;
> +	}
>  
>  	ret = zynqmp_pm_register_sgi(sgi_num, 0);
>  	if (ret) {
> @@ -670,6 +674,7 @@ static int xlnx_event_manager_probe(struct platform_device *pdev)
>  		else
>  			dev_err(&pdev->dev, "SGI %d registration failed, err %d\n", sgi_num, ret);
>  
> +		cpuhp_remove_state(hp_state);
>  		xlnx_event_cleanup_sgi(pdev);
>  		return ret;
>  	}
> @@ -704,6 +709,7 @@ static void xlnx_event_manager_remove(struct platform_device *pdev)
>  	if (ret)
>  		dev_err(&pdev->dev, "SGI unregistration over TF-A failed with %d\n", ret);
>  
> +	cpuhp_remove_state(hp_state);
>  	xlnx_event_cleanup_sgi(pdev);
>  
>  	event_manager_availability = -EACCES;

It looks like this patch 2/2 doesn't have the kind of bugs in the
cleanup path that affected patch 1/2, so that's good.

Regards,
Srivatsa

