Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294C2606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 01:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G+YaGIwW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVbG+S8r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=arPn7WtxfLxdl/Ql8VXSpyR7twcFlAaLYoR9XNbcjQM=; b=G+YaGIwWmhcZ2m
	BSa716+hDRfQWkg/OlOggh9j2WTZ0tY2K06nq4msjfumRuQI59ZSR6zrMs9oGnqCwn09U/KbvyPDA
	O8S52ElcLqdZQAnoirTi6xWI3p+Oq4xjjXk2ILOhn+yt57h399tdx9LSB5S7eJkwqPF3p9zxAD8Dx
	IoU2IK3Phv6uo+Oc9fmw0Ru/DSwnAeBU+fAqnXJDzZw3tzl9AgbpPsj0G5uXMxg+7xUfihi6nvwD4
	c2mhkw704XfGrn2ZZXmWTKhvz7QlK1gwpGcraw0i3q0OpzSghAljhUOYWCYEbQf+5pKpTuPHjBXC4
	jo31nDaRmtTTdje2hbzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDcN-0000000Dql9-3GJG;
	Fri, 20 Nov 2026 01:40:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUDcL-0000000Dqka-2HYQ;
	Fri, 20 Nov 2026 01:40:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F01454633B;
	Fri, 20 Nov 2026 01:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441261F000C6;
	Fri, 20 Nov 2026 01:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795138844;
	bh=arPn7WtxfLxdl/Ql8VXSpyR7twcFlAaLYoR9XNbcjQM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=YVbG+S8rzbkIJ+L3qzj8M1Nv3YTRq8wfpnXXRit2wivQK7cZmk51c4i4YUy46lqgA
	 nz8NoVJv37mMZoZssUFZqsD4AahF68TDEgFhQFi4ZPXP/lGqXa0lmnePowvvENNmDA
	 yYAWkAIlIYS7MqAWQqlf4yTqSkybmyyKwygPjSVPSa4ihgIFlTIzTUMTar9VFF3ZMd
	 nyZsTG+bJT7oazO3jwFTBLlbrsLGpnf7Oh68XMv3UKuWjfiEV171dLDPmLiyV/6Ekv
	 RDKIdt3vHNJSVW+1yXz+i3tQRje/IRlYiKYFugiUe1JlVrrKdY6GKweW5NQA7AzkFV
	 SopICCUUdFmzA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/6] clk: Remove unused clk.dev
From: Brian Masney <masneyb@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-pm@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>
References: <cover.1795094688.git.geert+renesas@glider.be>
 <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>
Date: Thu, 19 Nov 2026 20:40:22 -0500
Message-Id: <179513882271.284394.17357508909448455391.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=3498; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=z1U18tUBXV2KWpqoDsfdQQ2VwXPEc5TWEUSZc5tPF08=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+L+UOKLbN0At7HldxNMuj6q7jI+/5bMeYzSawW5bon
 y5cfXxBRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOJuMjIcFG5+MsMfhUXoXfW
 GZeY7l+0Od/4dLF1k2iEg/nK408C8hgZ7s94f/tdwmWfdwsdNnoE3H22+r6q9/npQWUmnTvmXZG
 7zwcA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This basically reverts commit efa850487a6b6742 ("clk: Inform the core
> about consumer devices").
> 
> This commit added a struct device pointer member to struct clk and a
> parameter to clk_hw_create_clk(), but the new member was never used
> beyond setting.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/clk/clk.c    | 14 +++++---------
>  drivers/clk/clk.h    | 11 ++++-------
>  drivers/clk/clkdev.c | 14 ++++----------
>  3 files changed, 13 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 673eac47450b..858f4d60ed2d 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -160,7 +160,6 @@ struct clk_core {
>  
>  struct clk {
>  	struct clk_core	*core;
> -	struct device *dev;
>  	const char *dev_id;
>  	const char *con_id;
>  	unsigned long min_rate;
> @@ -4249,7 +4248,6 @@ static void free_clk(struct clk *clk)
>  /**
>   * clk_hw_create_clk: Allocate and link a clk consumer to a clk_core given
>   * a clk_hw
> - * @dev: clk consumer device
>   * @hw: clk_hw associated with the clk being consumed
>   * @dev_id: string describing device name
>   * @con_id: connection ID string on device
> @@ -4259,9 +4257,8 @@ static void free_clk(struct clk *clk)
>   * consumers. It connects a consumer to the clk_core and clk_hw structures
>   * used by the framework and clk provider respectively.
>   */
> -struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
> -			      const char *dev_id, const char *con_id,
> -			      struct module *owner)
> +struct clk *clk_hw_create_clk(struct clk_hw *hw, const char *dev_id,
> +			      const char *con_id, struct module *owner)
>  {
>  	struct clk *clk;
>  	struct clk_core *core;
> @@ -4274,7 +4271,6 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
>  	clk = alloc_clk(core, dev_id, con_id);
>  	if (IS_ERR(clk))
>  		return clk;
> -	clk->dev = dev;
>  
>  	/*
>  	 * Pin the provider module only when the consumer lives in a different
> @@ -4303,7 +4299,7 @@ struct clk *__clk_hw_get_clk(struct clk_hw *hw, const char *con_id,
>  	struct device *dev = hw->core->dev;
>  	const char *name = dev ? dev_name(dev) : NULL;
>  
> -	return clk_hw_create_clk(dev, hw, name, con_id, owner);
> +	return clk_hw_create_clk(hw, name, con_id, owner);
>  }
>  EXPORT_SYMBOL(__clk_hw_get_clk);
>  
> @@ -5392,7 +5388,7 @@ struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
>  {
>  	struct clk_hw *hw = of_clk_get_hw_from_clkspec(clkspec);
>  
> -	return clk_hw_create_clk(NULL, hw, NULL, __func__, NULL);
> +	return clk_hw_create_clk(hw, NULL, __func__, NULL);
>  }
>  EXPORT_SYMBOL_GPL(of_clk_get_from_provider);
>  
> @@ -5420,7 +5416,7 @@ static struct clk *__of_clk_get(struct device_node *np,
>  {
>  	struct clk_hw *hw = of_clk_get_hw(np, index, con_id);
>  
> -	return clk_hw_create_clk(NULL, hw, dev_id, con_id, NULL);
> +	return clk_hw_create_clk(hw, dev_id, con_id, NULL);
>  }
>  
>  struct clk *of_clk_get(struct device_node *np, int index)
> diff --git a/drivers/clk/clk.h b/drivers/clk/clk.h
> index 5009380863a9..ba23700149de 100644
> --- a/drivers/clk/clk.h
> +++ b/drivers/clk/clk.h
> @@ -5,8 +5,6 @@
>   */
>  
>  struct clk_hw;
> -struct device;
> -struct of_phandle_args;

Did you mean to remove of_phandle_args?

Otherwise this looks good to me.

Brian

-- 
Brian Masney <masneyb@kernel.org>

