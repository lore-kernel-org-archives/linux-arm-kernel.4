Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D89606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i9+NmVU3;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=b+c5zFzb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9baLRy6PuRfKPu52T+JMh1Xvttd6fycEOeAlQX9Fbco=; b=i9+NmVU3WbhSIKPJr2QVV14TKG
	pHbFhLMU1IJhNGihxFdoQvBwkkqWRJr1zkCxM01D2eINFYv9YXGgy0UHPfDEtjAKVRMOXHDobYEjz
	Jq4hikSUUFqQ39hLtKKHdhJfLmAfDuIBEjbJq86Kkm9ebRItAEMXyfnDyORtvffEmfBqOwLSPyRVf
	Sj94rWkMfNokXeAC6cijCj9RwwFDVa4HS0s0hxtuih2FemFjMi7XbCQfb5cQnktyD0v8R7/qps+5e
	4H4iAfmqscd62XnImU8ucCJClx/nRsPCGXYWXx4ipDQCQJ7hxe/5j2TSkewLX31CJ01V+Xad/WzgA
	NEId7D5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRni-0000000349C-1y0K;
	Mon, 23 Nov 2026 11:01:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRnc-00000003479-0GHp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:01:33 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57521177;
	Mon, 23 Nov 2026 11:58:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795431534;
	bh=5hqJD3AbPoo6JiX/eE7N7lyp8uyKcnxG0dSWzKXr3MM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+c5zFzbG4eQfeQqPqWNPxMD4xLARc8Cvx7jjrTW2pOj8YnE/swkyBnJ+pU7lK1AP
	 5wvaHjS/R5+S00YgJ/6j2uQ0wvIeoFItHBWbTZA5HE47z7ihGa3kSfr8/dO44UtQ9U
	 9I0DPQMZgWjxRBR6FDI3VyiL+koobmUwWQuHXHG8=
Date: Mon, 23 Nov 2026 13:01:25 +0200
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
Subject: Re: [PATCH v5 02/15] clk: renesas: r8a78000: Replace sentinel by
 explicit ID map size
Message-ID: <20261123110125.GC3010398@killaraus.ideasonboard.com>
References: <cover.1795029012.git.geert+renesas@glider.be>
 <bf9d3d694fc06f29819b6883610c0e86c2d0066e.1795029012.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bf9d3d694fc06f29819b6883610c0e86c2d0066e.1795029012.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_030128_258556_1A4FE475 
X-CRM114-Status: GOOD (  29.04  )
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

On Wed, Nov 18, 2026 at 08:44:50PM +0100, Geert Uytterhoeven wrote:
> The use of a sentinel in the clock ID mapping array will become
> cumbersome when the need arises to find out the actual number of
> elements in the array.  Rework the mapping data structure to fix this,
> also improving naming.  Add a CLK_ID_MAP() initialization macro for
> brevity.
> 
> While at it, drop the check for "!map" in clk_id_map_find(), as that
> pointer can never be NULL.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v5:
>   - New.
> ---
>  drivers/clk/renesas/r8a78000-cpg.c | 45 +++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
> index 0e11ae139fbffd80..03fcd128d4293cfc 100644
> --- a/drivers/clk/renesas/r8a78000-cpg.c
> +++ b/drivers/clk/renesas/r8a78000-cpg.c
> @@ -16,11 +16,21 @@
>  
>  #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
>  
> -struct clk_map {
> -	int dt_id;		/* DT binding clock ID or -1 sentinel */
> +struct clk_id_map_entry {
> +	u32 dt_id;		/* DT binding clock ID */
>  	u32 fw_id;		/* FIXED_CLK() ID */
>  };
>  
> +struct clk_id_map {
> +	const struct clk_id_map_entry *entries;
> +	unsigned int size;
> +};
> +
> +#define CLK_ID_MAP(_entries) &(struct clk_id_map) {	\
> +	.entries = _entries,				\
> +	.size = ARRAY_SIZE(_entries),			\
> +}
> +
>  enum fixed_clk {
>  	FIXED_CLK_66M,
>  	FIXED_CLK_133M,
> @@ -40,23 +50,21 @@ static const unsigned long fixed_clk_rates[NUM_FIXED_CLKS] = {
>   * struct r8a78000_cpg_priv - Clock Pulse Generator Private Data
>   *
>   * @dev: CPG device
> - * @map: Mapping from DT clock IDs to fixed-rate clocks
> + * @map: Mapping from DT clock IDs to fixed-rate clock IDs
>   * @fixed_hws: Fixed rate clocks
>   */
>  struct r8a78000_cpg_priv {
>  	struct device *dev;
> -	const struct clk_map *map;
> +	const struct clk_id_map *map;
>  	struct clk_hw *fixed_hws[NUM_FIXED_CLKS];
>  };
>  
> -static const struct clk_map *clk_map_find(const struct clk_map *map, u32 id)
> +static const struct clk_id_map_entry *clk_id_map_find(const struct clk_id_map *map,
> +						u32 dt_id)
>  {
> -	if (!map)
> -		return NULL;
> -
> -	for (; map->dt_id >= 0; map++) {
> -		if (map->dt_id == id)
> -			return map;
> +	for (unsigned int i = 0; i < map->size; i++) {
> +		if (map->entries[i].dt_id == dt_id)
> +			return &map->entries[i];
>  	}
>  
>  	return NULL;
> @@ -65,8 +73,8 @@ static const struct clk_map *clk_map_find(const struct clk_map *map, u32 id)
>  static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec, void *data)
>  {
>  	struct r8a78000_cpg_priv *priv = data;
> +	const struct clk_id_map_entry *entry;
>  	struct device *dev = priv->dev;
> -	const struct clk_map *map;
>  	struct clk_hw *hw;
>  	u32 id;
>  
> @@ -75,13 +83,13 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec, void *data)
>  
>  	id = spec->args[0];
>  
> -	map = clk_map_find(priv->map, id);
> -	if (!map) {
> +	entry = clk_id_map_find(priv->map, id);
> +	if (!entry) {
>  		dev_err(dev, "Unknown clock %u\n", id);
>  		return ERR_PTR(-ENOENT);
>  	}
>  
> -	hw = priv->fixed_hws[map->fw_id];
> +	hw = priv->fixed_hws[entry->fw_id];
>  
>  	dev_dbg(dev, "Mapping DT clock %u to %s at %lu Hz\n", id,
>  		clk_hw_get_name(hw), clk_hw_get_rate(hw));
> @@ -116,7 +124,7 @@ static int r8a78000_cpg_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct r8a78000_cpg_priv *priv;
> -	const struct clk_map *map;
> +	const struct clk_id_map *map;
>  	int ret;
>  
>  	map = of_device_get_match_data(dev);
> @@ -137,17 +145,16 @@ static int r8a78000_cpg_probe(struct platform_device *pdev)
>  	return devm_of_clk_add_hw_provider(dev, r8a78000_clk_get, priv);
>  }
>  
> -static const struct clk_map r8a78000_cpg_default[] = {
> +static const struct clk_id_map_entry r8a78000_cpg_default[] = {
>  	{ R8A78000_CPG_SGASYNCD4_PERW_BUS,	FIXED_CLK(266M) },
>  	{ R8A78000_CPG_SGASYNCD8_PERW_BUS,	FIXED_CLK(133M) },
>  	{ R8A78000_CPG_SGASYNCD16_PERW_BUS,	FIXED_CLK(66M) },
> -	{ -1 }
>  };
>  
>  static const struct of_device_id r8a78000_cpg_match[] = {
>  	{
>  		.compatible = "renesas,r8a78000-cpg",
> -		.data = &r8a78000_cpg_default,
> +		.data = CLK_ID_MAP(r8a78000_cpg_default),
>  	},
>  	{ /* sentinel */ }
>  };

-- 
Regards,

Laurent Pinchart

