Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DFA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h5ALIyft;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=b8ohZFPH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vh1LakTnS8qDnqTNZjFoXfkcl6LQaAAvrHhe/rYchqw=; b=h5ALIyftzoigI8v1OdSfYHOCqe
	+tgjC0JtO4xecKu+dGcRKB5aEstGuKr9xuxoU9Y/6tipLmNcqdE/r7FjNGzTcSuZgs14TEUGiRUjJ
	+IYphVVaER7BHFmuwiYZ6YakPdF1KzOF/8p+tbeBfPGuoZcyfA0ZX9Oo5SIJI1Gudp28Xrz05gXNx
	lGG5wmlapnpqzxeUuWm7xQBL78uXYakOAK5ddMOKCkQH9l3jG9m46KP7ipdOeXxVR4OmL3YAlo+G2
	KzXz3J0WujNmRmWLIcBenvM0Spc3UmSM7bT7AaJlZ/2uRpuEh77aeCjiE1OD9GPlTJT6/0Rw5e0uX
	NQqeuWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRyk-000000035uD-2FS6;
	Mon, 23 Nov 2026 11:12:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRyh-000000035tR-38ju
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:12:57 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EF4473E;
	Mon, 23 Nov 2026 12:10:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795432221;
	bh=upJhjegpWDQfOzFhkF7sS1wywVD1477rg/cPt2EFbLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b8ohZFPHnUSX4XJqicAsg661IvSd98c33Vb05UnAK9TiRMqcaPowe5BJrMrqgkqxf
	 j7hfnKq0i+4mJtwPW6B2jp3XORvuBW7hnrDVkDAcqO+jd13VPuTTNQVgnS6gCF22B0
	 x2MIbDW0Q6jhWRK0CK6Jysk0rD/2oZg61piQiK4A=
Date: Mon, 23 Nov 2026 13:12:52 +0200
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
Subject: Re: [PATCH v5 03/15] clk: renesas: r8a78000: Shrink IDs to 16 bits
Message-ID: <20261123111252.GE3010398@killaraus.ideasonboard.com>
References: <cover.1795029012.git.geert+renesas@glider.be>
 <066c0c074865c2a8684f541c3513b8851f3b09a9.1795029012.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <066c0c074865c2a8684f541c3513b8851f3b09a9.1795029012.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031255_936426_F41B30D8 
X-CRM114-Status: GOOD (  16.11  )
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

On Wed, Nov 18, 2026 at 08:44:51PM +0100, Geert Uytterhoeven wrote:
> Reduce table size by shrinking DT and fixed-rate clock IDs from 32 to 16
> bits, which is still plenty.

Until the day someone decides to use clock IDs higher than 65535 in the
SCP firmware :-)

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v5:
>   - New.
> ---
>  drivers/clk/renesas/r8a78000-cpg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a78000-cpg.c
> index 03fcd128d4293cfc..236c638834703f95 100644
> --- a/drivers/clk/renesas/r8a78000-cpg.c
> +++ b/drivers/clk/renesas/r8a78000-cpg.c
> @@ -17,8 +17,8 @@
>  #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
>  
>  struct clk_id_map_entry {
> -	u32 dt_id;		/* DT binding clock ID */
> -	u32 fw_id;		/* FIXED_CLK() ID */
> +	u16 dt_id;		/* DT binding clock ID */
> +	u16 fw_id;		/* FIXED_CLK() ID */
>  };
>  
>  struct clk_id_map {

-- 
Regards,

Laurent Pinchart

