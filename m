Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB19606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GIIpHQ8B;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SEDOM6wr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HHGmLupEWefFEvnztUn4+WoF1FkERF+EXpdnacXhrEo=; b=GIIpHQ8BpjE08ysg/31APrOxYl
	VMmisRT6uXCl+SmvbB2zl+rdb5e8lLCgmDv3n+p87owDpgw9SmZdv5YkkU3mJScPhJZAJ5sDIlJzX
	GG1FCiJ6M+rvqImKbKTRupJZk89epuaY+fzOiWjPlOgO78q9nV8hL9XEIdhIcPGi++iKL5U9csp5O
	o18OXn2ALm+J9iG0LGX0oAtoAbhz7rTuXCBd73nEJnl7sDnjP2V7MbA7S5CjUnJkij1ZP0iKDhcSQ
	2Mh6rAj3+1Wg3ruICCfZViH5cple19MaVCCafIK6OLlN+c2GDy3VNZk30v6Ha0MXYHeo7BSP8GfDl
	9OvjpoKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSOP-00000003E0z-2FvN;
	Mon, 23 Nov 2026 11:39:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSOE-00000003Dwq-3ssl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:39:23 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E58434;
	Mon, 23 Nov 2026 12:36:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795433805;
	bh=twN40ocQKuIxsUo/Hj5ZWM2UJ1adNtywfmriFNONsX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEDOM6wrVeABopjd6nno09PgGLDk0rJ6n6z+83f1myistJ04J56SIQ/yyvkXwdcbm
	 5ktdY8RdyH5x7SBWcgbb0eXFDM+/fKsPjwA3OMHz83mbxTWlAYfG2/5opz4pPmws+4
	 6M03F/iNxa2gK5G3D3vjJtR+JBn1tA7hE4Jq+Ftk=
Date: Mon, 23 Nov 2026 13:39:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Paul Elder <paul.elder+renesas@ideasonboard.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 12/15] pmdomain: renesas: r8a78000: Replace sentinel
 by explicit ID map size
Message-ID: <20261123113915.GI3010398@killaraus.ideasonboard.com>
References: <cover.1795029012.git.geert+renesas@glider.be>
 <ee60a54c457af21277a13e8e1db36ce83209b3f5.1795029012.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ee60a54c457af21277a13e8e1db36ce83209b3f5.1795029012.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_033919_868476_B2659E4B 
X-CRM114-Status: GOOD (  29.91  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 08:45:00PM +0100, Geert Uytterhoeven wrote:
> The use of a sentinel in the module ID mapping array will become
> cumbersome when the need arises to find out the actual number of
> elements in the array.  Rework the mapping data structure to fix this,
> also improving naming.  Let mod_id_map_find() return an index, to be
> used for indexing additional mapping target arrays later.
> Add a MOD_ID_MAP() initialization macro for brevity.
> 
> While at it, drop the check for "!map" in mod_id_map_find(), as that
> pointer can never be NULL.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - New.
> ---
>  drivers/pmdomain/renesas/r8a78000-mdlc.c | 49 +++++++++++++-----------
>  1 file changed, 27 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> index 1ace1fb10870f646..6477abe64511e880 100644
> --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> @@ -16,13 +16,23 @@
>  
>  #include <dt-bindings/power/renesas,r8a78000-mdlc.h>
>  
> -struct mod_map {
> -	int hw_id;		/* Hardware module ID or -1 sentinel */
> +struct mod_id_map_entry {
> +	u32 hw_id;		/* Hardware module ID */
>  };
>  
> +struct mod_id_map {
> +	const struct mod_id_map_entry *entries;
> +	unsigned int size;
> +};
> +
> +#define MOD_ID_MAP(_entries) .mod_map = &(struct mod_id_map) {		\
> +	.entries = _entries,						\
> +	.size = ARRAY_SIZE(_entries),					\
> +}
> +
>  struct mdlc_info {
>  	u32 base;
> -	const struct mod_map *mod_map;
> +	const struct mod_id_map *mod_map;
>  };
>  
>  /**
> @@ -41,7 +51,7 @@ struct r8a78000_mdlc_priv {
>  	struct reset_controller_dev rcdev;
>  	struct device *dev;
>  	struct device_node *np;
> -	const struct mod_map *mod_map;
> +	const struct mod_id_map *mod_map;
>  };
>  
>  static struct generic_pm_domain *r8a78000_genpd_always_on;
> @@ -77,17 +87,14 @@ static struct generic_pm_domain *r8a78000_genpd_xlate(
>  #define rcdev_to_priv(_rcdev)	\
>  	container_of(_rcdev, struct r8a78000_mdlc_priv, rcdev)
>  
> -static const struct mod_map *mod_map_find(const struct mod_map *map, u32 id)
> +static int mod_id_map_find(const struct mod_id_map *map, u32 hw_id)

Same comment as in the clock driver about prefixes and namespace
clashes.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  {
> -	if (!map)
> -		return NULL;
> -
> -	for (; map->hw_id >= 0; map++) {
> -		if (map->hw_id == id)
> -			return map;
> +	for (unsigned int i = 0; i < map->size; i++) {
> +		if (map->entries[i].hw_id == hw_id)
> +			return i;
>  	}
>  
> -	return NULL;
> +	return -1;
>  }
>  
>  static int r8a78000_mdlc_reset_xlate(struct reset_controller_dev *rcdev,
> @@ -95,7 +102,7 @@ static int r8a78000_mdlc_reset_xlate(struct reset_controller_dev *rcdev,
>  {
>  	struct r8a78000_mdlc_priv *priv = rcdev_to_priv(rcdev);
>  	struct device *dev = priv->dev;
> -	const struct mod_map *map;
> +	int idx;
>  	u32 id;
>  
>  	if (spec->args_count != 1)
> @@ -103,8 +110,8 @@ static int r8a78000_mdlc_reset_xlate(struct reset_controller_dev *rcdev,
>  
>  	id = spec->args[0];
>  
> -	map = mod_map_find(priv->mod_map, id);
> -	if (!map) {
> +	idx = mod_id_map_find(priv->mod_map, id);
> +	if (idx < 0) {
>  		dev_err(dev, "Unknown reset 0x%x\n", id);
>  		return -ENOENT;
>  	}
> @@ -141,9 +148,8 @@ static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
>  	struct device_node *np = dev->of_node;
>  	struct r8a78000_mdlc_priv *priv;
>  	struct of_phandle_args pd_spec;
> -	const struct mod_map *map;
>  	unsigned int id;
> -	int ret;
> +	int ret, idx;
>  
>  	ret = of_parse_phandle_with_args(np, "power-domains",
>  					 "#power-domain-cells", 0, &pd_spec);
> @@ -166,8 +172,8 @@ static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
>  	id = pd_spec.args[1];
>  	of_node_put(pd_spec.np);
>  
> -	map = mod_map_find(priv->mod_map, id);
> -	if (!map) {
> +	idx = mod_id_map_find(priv->mod_map, id);
> +	if (idx < 0) {
>  		dev_err(dev, "Unknown module 0x%x\n", id);
>  		return -ENOENT;
>  	}
> @@ -292,15 +298,14 @@ static int r8a78000_mdlc_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static const struct mod_map r8a78000_mdlc_perw_mod_default[] = {
> +static const struct mod_id_map_entry r8a78000_mdlc_perw_mod_default[] = {
>  	{ 0x54 },	/* HSCIF0 */
> -	{ -1 }
>  };
>  
>  static const struct mdlc_info r8a78000_mdlc_default[] = {
>  	{
>  		.base = 0xc05d0000,
> -		.mod_map = r8a78000_mdlc_perw_mod_default,
> +		MOD_ID_MAP(r8a78000_mdlc_perw_mod_default),
>  	},
>  	{ /* sentinel */ }
>  };

-- 
Regards,

Laurent Pinchart

