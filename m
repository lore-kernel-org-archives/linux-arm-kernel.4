Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDE4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hOuZniiF;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JLMU4vB1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J3D5X9whr4CuICRWtOTLXhbuJoZ16bdz2KO7jQpTW6I=; b=hOuZniiFNMRqZ/iiRQYog3m4P2
	3707QVSjv1Kh73nhP725jV8aSGfDbjpnMqiiKKCMerkwJasOCTNmj3W87K0soUTsNB8oEbUtF6jlo
	r6MSNoRfGRZaKJRbevD3yAmOyzyWcaZViffUzygww3GrSPoTIBZ2fE+u3oZnABgcZZ3NUaLggEiO9
	Lfj7fqhFr+IlUYGlZBxK90T5uKstgw72SRFChGixqcWdIZHXbP057OG5mBAuhgzOz3uT4q9F5y6Vb
	tXIiHcVm7hrA1NLEkX6sWjXRnS/q6H0XV9C25MJIKhKAANJH0dLUgKGo/6lxBP7uGZGi8mUcqkmyq
	yLRY+TtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHE9-00000005QA3-3bla;
	Tue, 17 Nov 2026 11:19:53 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHE7-00000005Q9U-1oyd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 11:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794914392; x=1826450392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kDTwPyTQqXQY+QlQDSQh1XOk2yJFdM0AYsZ+EJDMvEo=;
  b=JLMU4vB1WuHYSlTGq28Tk+zzb3oHb4UGRLcHn7zMk0r9+LbFmZixCbUX
   rhgIbAdM2b5IukR4AIDpj9XB28WbDzST6LjDkGvrtoy50gY/2S7Pr37bl
   fhqERW2C7dnVucW3AYd/0Crt1IS7dRwpiOcV3oyGoYApJAfN2SqlJdy/k
   bJQgtlCw2nXDn2zGkkYsicbOkAAS3ynUob2Pvx69vqVGaRstlCNf9iDVd
   q8kpPQzcWb8cGjFUFeS0sZudhXPsnaeVmDj6/X9SD5DUtiCBCwFe9EzP0
   KkHS/ib3L/3yvbUA5+ojg4H3sAtnQaV4t4kcdjp86/QPxlQxA5lbE2NWh
   A==;
X-CSE-ConnectionGUID: BvA8a3yPQuuNLQlYOfUAnw==
X-CSE-MsgGUID: HgAIjleeRDWJLoB6oGecsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3718483"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3718483"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 03:19:48 -0800
X-CSE-ConnectionGUID: /773YfFXSBe/CQyzRBqquw==
X-CSE-MsgGUID: nQMrnzpiRBmYETnaUUYjtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10171978"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2026 03:19:45 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 785AC99; Tue, 17 Nov 2026 12:19:44 +0100 (CET)
Date: Tue, 17 Nov 2026 12:19:44 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Keisuke Tsukuda <tkdkei@outlook.jp>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: roles: wait for role callbacks on unregister
Message-ID: <avw4UE8H7t0Ybq6_@black.igk.intel.com>
References: <20261112024101.83321-1-tkdkei@outlook.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112024101.83321-1-tkdkei@outlook.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_031951_510366_CA3F15FC 
X-CRM114-Status: GOOD (  28.29  )
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

Hi,

On Thu, Nov 12, 2026 at 02:41:24AM +0000, Keisuke Tsukuda wrote:
> usb_role_switch_set_role() and usb_role_switch_get_role() check the
> registered flag before taking the switch lock. If a provider is
> unregistered during a role request, unregister can return while its
> callback is still running. The provider may then free memory used by
> the callback, causing a use-after-free. A caller that passed the check
> can also enter a callback after unregister returns.
> 
> Move the registered checks under the switch lock and clear the flag while
> holding the same lock on unregister. This waits for active callbacks and
> rejects callers that acquire the lock after the flag is cleared.
> 
> The Apple DWC3 remove path currently holds its private mutex around
> unregister. Its role callbacks take that mutex under the switch lock, so
> waiting on the switch lock in unregister would reverse the lock order.
> Unregister before taking the Apple mutex.
> 
> Fixes: fde0aa6c175a ("usb: common: Small class for USB role switches")
> Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>
> ---
> Tested on ARM64 QEMU with Linux 7.3.4 and mainline 7.4-rc2
> (067c5c24cef2), with KASAN and lockdep enabled. Synthetic providers
> trigger KASAN use-after-free reports in both set and get callbacks before
> this change. With the change, unregister waits for the callbacks and
> neither test reports KASAN.
> 
> A lockdep test modeling the Apple callback/remove lock order warns for the
> original order and not for the new one. Apple DWC3 hardware was not tested.
> 
>  drivers/usb/roles/class.c     |   18 ++++++++++++++----
>  drivers/usb/dwc3/dwc3-apple.c |    4 ++--
>  2 files changed, 16 insertions(+), 6 deletions(-)

If you get this reply for the second time, then I'm sorry for the
noise. There's something wrong with our SMTP. I don't see all my
replies on the usb ml.

Please split this, one patch for the class and another for dwc3.

Also, don't forget to CC stable. This is a fix:
https://docs.kernel.org/process/submitting-patches.html#select-the-recipients-for-your-patch

Thanks,

> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -79,10 +79,11 @@
>  	if (IS_ERR_OR_NULL(sw))
>  		return 0;
>  
> -	if (!sw->registered)
> -		return -EOPNOTSUPP;
> -
>  	mutex_lock(&sw->lock);
> +	if (!sw->registered) {
> +		ret = -EOPNOTSUPP;
> +		goto unlock;
> +	}
>  
>  	ret = sw->set(sw, role);
>  	if (!ret) {
> @@ -90,6 +91,7 @@
>  		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
>  	}
>  
> +unlock:
>  	mutex_unlock(&sw->lock);
>  
>  	return ret;
> @@ -107,16 +109,21 @@
>  {
>  	enum usb_role role;
>  
> -	if (IS_ERR_OR_NULL(sw) || !sw->registered)
> +	if (IS_ERR_OR_NULL(sw))
>  		return USB_ROLE_NONE;
>  
>  	mutex_lock(&sw->lock);
> +	if (!sw->registered) {
> +		role = USB_ROLE_NONE;
> +		goto unlock;
> +	}
>  
>  	if (sw->get)
>  		role = sw->get(sw);
>  	else
>  		role = sw->role;
>  
> +unlock:
>  	mutex_unlock(&sw->lock);
>  
>  	return role;
> @@ -423,7 +430,10 @@
>  {
>  	if (IS_ERR_OR_NULL(sw))
>  		return;
> +	/* Wait for in-flight set/get callbacks before unregistering. */
> +	mutex_lock(&sw->lock);
>  	sw->registered = false;
> +	mutex_unlock(&sw->lock);
>  	if (dev_fwnode(&sw->dev))
>  		component_del(&sw->dev, &connector_ops);
>  	device_unregister(&sw->dev);
> diff --git a/drivers/usb/dwc3/dwc3-apple.c b/drivers/usb/dwc3/dwc3-apple.c
> --- a/drivers/usb/dwc3/dwc3-apple.c
> +++ b/drivers/usb/dwc3/dwc3-apple.c
> @@ -487,9 +487,9 @@
>  	struct dwc3 *dwc = platform_get_drvdata(pdev);
>  	struct dwc3_apple *appledwc = to_dwc3_apple(dwc);
>  
> +	usb_role_switch_unregister(appledwc->role_sw);
> +
>  	guard(mutex)(&appledwc->lock);
> -
> -	usb_role_switch_unregister(appledwc->role_sw);
>  
>  	/*
>  	 * If we're still in DWC3_APPLE_PROBE_PENDING we never got any cable connected event and

-- 
heikki

