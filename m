Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CA4606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=isfq7PW5;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JmTsHqyN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Yave6DZDGUUAvsSfmLDal9WFXgDPPi+dD/iYkllA/8=; b=isfq7PW5XJY+Aet58PStgKrlEb
	8z6xtjPviX7Q+h6yq2KGo2iVip5fvW72giRixQ9GQTj5lyLvYN5ovYglR2ScwJ8wrHoyZUkfJJ2bu
	nbaJkWNv1Sh8HE8aiKSpTs7AFp+1+Ihhu/dQqr4pnrEZznTJAtE64i6KejBN32kqsFm5TtMelSUzK
	Vj6whflbbphBh5ChRIYxwoQ8KnV+Tn+5KIjatvHErKYxYnJnhDK1oozJJWwW/yaZhgUeKldXNy4JU
	opEFdp4IFpc2ssM4/dwlhDzw4mofelQZglIHhCUaO+cCbKUcEi7MXuGtkWW8jAHEmtZ9CmUogOpJB
	OTNSAm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOaW-0000000F5Uj-23Dd;
	Fri, 20 Nov 2026 13:23:36 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOaS-0000000F5UE-3NGY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795181013; x=1826717013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cJJw5vbcJuFQOpdae3ptvun5p75snXhnCZwChzdLyPk=;
  b=JmTsHqyNgjcsZ3KorIrQa45x1ep2vbv3MJkc8xi6pqzsZy9Qux4LuAE6
   FRzqgnC6fzSDLzAITYd8Yqe8CiHgeHqB007pLikPM3DG3sYQ+Uy4hh3Ee
   7SOCqfG+o4vO0SM4cubpOCRem2JZReZDtvE4EY7T79WIv1IqIeeHlv1MH
   KFZlRGRALMvlv3fSPZbzoZ5AopgkigkLguA23PBV28OEpOOvsRSwMlzXc
   jhP1M10mUAYn2mtasxuZMCpo2bKv8XPtG/xosWVhRUsys/5RP24NJXiT1
   AJEZvmki6SIimF2EJJgxdxYhbasGXc2nYTOs7wIg5ve024lzCCdtnVrL3
   g==;
X-CSE-ConnectionGUID: IAP54H+EQcaRXQyk/lpgnA==
X-CSE-MsgGUID: QLiRUD9fQa+Nsv4nI7SQFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3945346"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3945346"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 05:23:32 -0800
X-CSE-ConnectionGUID: +D3uAwM0Ql+ilvQ35dXt6w==
X-CSE-MsgGUID: LFt9NXU/RaC7A91NKsxlkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11035886"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 20 Nov 2026 05:23:29 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 0BF6799; Fri, 20 Nov 2026 14:23:28 +0100 (CET)
Date: Fri, 20 Nov 2026 14:23:28 +0100
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
Subject: Re: [PATCH v2 2/2] usb: roles: wait for callbacks on unregister
Message-ID: <awBJ0NDCvbznrBjk@black.igk.intel.com>
References: <20261117125825.27629-1-tkdkei@outlook.jp>
 <20261117125825.27629-3-tkdkei@outlook.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117125825.27629-3-tkdkei@outlook.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_052332_859268_0E5F7304 
X-CRM114-Status: GOOD (  22.12  )
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

On Tue, Nov 17, 2026 at 01:00:20PM +0000, Keisuke Tsukuda wrote:
> usb_role_switch_set_role() and usb_role_switch_get_role() check the
> registered flag before taking the switch lock. If a provider is
> unregistered during a role request, unregister can return while its
> callback is still running. The provider may then free memory used by
> the callback, causing a use-after-free. A caller that passed the check
> can also enter a callback after unregister returns.
> 
> Move the registered checks under the switch lock and clear the flag while
> holding the same lock on unregister. This waits for active callbacks and
> rejects callers that acquire the lock after the flag is cleared. The
> preceding Apple DWC3 change avoids a lock inversion in its remove path.
> 
> Fixes: fde0aa6c175a ("usb: common: Small class for USB role switches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/roles/class.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
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

-- 
heikki

