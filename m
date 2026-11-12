Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C64606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SV1PqdmO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=gTIN1Kf1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tLqa2FMlsnasCoo7Flq+ndrdNn8MeKqOwSnsMbw1pOY=; b=SV1PqdmO6HUL10aUEi2nHictfQ
	rT+POf3YijC4yDou8trNJ5TCrpZF2q5z3UALk7+bUUDJ3LzhClo1fzIfdKHudc/p/KAxDB5A5vXus
	Z3D10E0RpbVGxJvIdNjcl9WDJBTZgR7KQgitABRel/LbcqkD6iS+MGfIAu1JCBuZxik8YMzZ3SzS2
	kDbcDh5XZ1CJmK3Hcaf/TTMmFqgSZpWMxDrwHRxH3OC3c4i3yPUJBkog0BmlESF1X04LnUxUsMdp9
	Lrm003u2zxFm07K/4xtfkdYNVadXh9c/WFdd7ABXoh+oGJ5JPE5KA6DAYzQ/xg3Y175THdgzptaVl
	X8X38gGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSQX-00000009anZ-37j6;
	Thu, 12 Nov 2026 10:53:09 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSQV-00000009an7-1paH;
	Thu, 12 Nov 2026 10:53:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794480779; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BTHypljfRAlk3PgTfQxskdtuHNyT2eHhwDSiPxWGcIxxpp5EKRnJ9l+nwrKju1zF32gR5z4S+iYv6e0UOFFOJVukfdb78fs5wDpiizkF3aMI9YuQIHDRiOUHu1oYn4wFVQnzBD0whvsnuWpeVq2kHHZ9mEQOh1x+KGICvTM65bk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794480779; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tLqa2FMlsnasCoo7Flq+ndrdNn8MeKqOwSnsMbw1pOY=; 
	b=CH5rP2keafftl/e1MuUB8BRJ33woDqE+wNT/OnRtWXmlfi0E5Gt6anyAJ6nxg0Pe62OJ1t3oTh+JITovKbcfT3eeIQ8BnYkBps3ThTSFFnNzdFJ/lqE1rf6w7Ex/JT7PWP1aGzNJCIweSHxFLYC62xkN/gXRllCOXFyHQxBK+sg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=gTIN1Kf1OSDmSisFgXIGp5nzx0VF2FjdVAGWgze/GM97/5ObZWtXtixYOhOLTr5oOTMCHDXorlaH4phnj1Ijw0LsTX2uCTBCgF0TGLh3mNdZJPOpthgOr3pRIIJpI9Y9+OzZrIUx0AlL3cHOa6dmeFr8HOhPr59+d/J2v/9qirE=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=tLqa2FMlsnasCoo7Flq+ndrdNn8MeKqOwSnsMbw1pOY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794480778136240.92925563025153;
	Thu, 12 Nov 2026 02:52:58 -0800 (PST)
Date: Thu, 12 Nov 2026 10:52:43 +0000
From: Yao Zi <me@ziyao.cc>
To: aiyengar1990@gmail.com, Ulf Hansson <ulfh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Kevin Hilman <khilman@linaro.org>, Caesar Wang <wxt@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yao Zi <me@ziyao.cc>, Igor Pecovnik <igor@armbian.com>
Subject: Re: [PATCH v2 2/2] pmdomain: rockchip: report domain errors once,
 with dev_err_probe()
Message-ID: <avWae91pfLv9vyUv@pie>
References: <20261112-pmdomain-rockchip-v2-0-5cd942a23df7@gmail.com>
 <20261112-pmdomain-rockchip-v2-2-5cd942a23df7@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-pmdomain-rockchip-v2-2-5cd942a23df7@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.473.96
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_025307_731723_C9FB7B2F 
X-CRM114-Status: GOOD (  28.82  )
X-Spam-Score: -2.1 (--)
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

On Thu, Nov 12, 2026 at 08:23:30AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> When a power domain clock is not available yet,
> rockchip_pm_add_one_domain() returns -EPROBE_DEFER, and both it and its
> callers rockchip_pm_domain_probe() and rockchip_pm_add_subdomain() print
> that with dev_err():
> 
>   rockchip-pm-domain ...: power-domain: failed to get clk at index 1: -517
>   rockchip-pm-domain ...: failed to handle node power-domain: -517
> 
> once per probe attempt, and the second line twice for a nested domain.
> On an RK3588 board whose NPU domain clock appears late this is more than
> 20 error lines before the domain finally probes, and the reason of the
> deferral is not recorded. Other failures are reported twice (once where
> they happen and once by the callers), or only by the callers, which name
> the node but not what failed: a missing pm_qos phandle and a pm_qos node
> without a regmap print nothing in rockchip_pm_add_one_domain(), and a
> failed clk_bulk_prepare() only has the message of the clk core, which
> names neither the device nor the domain.
> 
> Report every error once, where it happens, with dev_err_probe(), and
> drop the "failed to handle (subdomain) node" messages from the callers.
> A deferral is then quiet and keeps its specific reason in
> /sys/kernel/debug/devices_deferred, such as "failed to get clk at index
> 1", and -ENOMEM, which the callers used to print, is quiet as well. The
> return values are unchanged, except that a failed
> syscon_node_to_regmap() for a pm_qos node now returns its own error
> instead of -ENODEV: it can be -EPROBE_DEFER (a syscon regmap that is
> not registered yet, or a syscon clock or hwlock that is not available
> yet), which must not turn into a probe failure.
> 
> Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
> Fixes: 6be05b5ec161 ("soc: rockchip: power-domain: add support for sub-power domains")
> Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 98 +++++++++++++++-------------------
>  1 file changed, 43 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
> index 00c7e78f89b5..be077fb52f40 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -804,28 +804,22 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
>  	int error;
>  
>  	error = of_property_read_u32(node, "reg", &id);
> -	if (error) {
> -		dev_err(pmu->dev,
> -			"%pOFn: failed to retrieve domain id (reg): %d\n",
> -			node, error);
> -		return -EINVAL;
> -	}
> +	if (error)
> +		return dev_err_probe(pmu->dev, -EINVAL,
> +				     "%pOFn: failed to retrieve domain id (reg)\n",
> +				     node);
>  
> -	if (id >= pmu->info->num_domains) {
> -		dev_err(pmu->dev, "%pOFn: invalid domain id %d\n",
> -			node, id);
> -		return -EINVAL;
> -	}
> +	if (id >= pmu->info->num_domains)
> +		return dev_err_probe(pmu->dev, -EINVAL,
> +				     "%pOFn: invalid domain id %d\n", node, id);

These look like code clean-up instead of fixes, thus should be split
into a separate patch, especially when we probably want to backport the
real fixes. This applies for many places below.

Aside these unnecessary code changes, this patch seems in a better shape
than the very first version[1] I submitted a week ago, which seems,
unfortunately, being ignored.

I'll drop the second patch in my series and use yours instead. But
please search before sending patches next time to avoid duplicated work.

-- 
Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.

[1]: https://lore.kernel.org/linux-rockchip/20261105001257.1368266-1-me@ziyao.cc/

