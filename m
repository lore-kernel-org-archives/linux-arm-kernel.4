Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7EC606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rx/X+Ux4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kwvwmjDA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Db0NSgXMkMNO+C2D5Me7g3QqZEixSPV9A2/gMgzci+4=; b=Rx/X+Ux4ZtZ/Mv
	Yqom0TpWjWGKXfTF8TPvu15RzwoW7M4lB1Pk4v1nXNHAEIflJI6m1nfSX19Sya+4kJs/lcHbe1rIH
	ZfzQ9RR3x7aW53Gi4+ZJ9juz/4MNfk4q2w1KlDWbQmO7bKYkZ7w8qg+VMb6sx07LeWzrXa0x0kPId
	A8y1erxJyLa8Lf7a7rrvGoyyRQm95K4dtfSIfMKBhWchbwIJpqIPRV270LEU0H80Xmqn0BQcr67Lo
	Wvvj2uY5OPiGG9TK6HLlXXbCSEGU5spZkwXhdusHOFEBQZFJlCqZOmnxB+XNLnStYv7o3X55o7L3/
	Dru22De3PFdCcKFgtu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF3L-0000000ANT2-2NeT;
	Wed, 25 Nov 2026 15:36:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF39-0000000ANNX-0ma9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:36:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7070F631BD;
	Wed, 25 Nov 2026 15:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09B11F000D2;
	Wed, 25 Nov 2026 15:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621006;
	bh=Db0NSgXMkMNO+C2D5Me7g3QqZEixSPV9A2/gMgzci+4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kwvwmjDAoL+Vj3LJyhaLGAWrR86wbbBIdS15WS6xazfyEjZ7kvnWwxjfOGBbHmB5X
	 Ye1o18WjwWuK1NtCC5i6piR3bPfdyaoEsRFKKLbHX0HMs1J/Iiahqj8U7jKmE1SDhI
	 C41Fs0A9gw4P7lb2WLsP04xTaxmX/bBuF8/Zrn6wb25WJ7eGONpImBPwRz6xDJ2oLu
	 55Np/qbyYBCkNZKJMYizEvPLqBOMSgQhW3+m3fImDvVinbEirVQBk81jAAHyEbJPcQ
	 SY4cXUvkY1/AhJNOx2b3FGF0+whmW/UDn523mnLZTSIQn188GaGXqTnoWFzD0+LtkI
	 WTQrRY77D4nJg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 7/8] clk: clocking-wizard: Fix division by zero and
 unbounded register write
From: Brian Masney <masneyb@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com, 
 shubhrajyoti.datta@gmail.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261124035613.1968260-8-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
 <20261124035613.1968260-8-shubhrajyoti.datta@amd.com>
Date: Wed, 25 Nov 2026 10:36:33 -0500
Message-Id: <179562099317.458327.4285167925748688864.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=UMWYa4TPDU8Q7t9X5oGe2QDTLUGyi07Kbjlh8X3LaZg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLZGVoreoKZZKLy780+0aUj0GRSYbzH7l7IxvL2qSxW4
 R8mXbrUUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwETuNTP8ZpdJ/rBmM3sDk4xr
 bPPk1Ec6mz/PYo3xu3RxpnPhlS1yggz/65IT2wPneP0I3/t6D9uxFOGO2et77Oxf792sk7dxrf4
 +TgA=
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

Hi Shubhrajyoti,

> 1. clk_wzrd_determine_rate(): DIV_ROUND_CLOSEST() can return 0 when
>    the requested rate greatly exceeds the parent rate, causing a
>    division by zero on the subsequent parent_rate / div. Clamp div
>    to a minimum of 1.
> 
> 2. clk_wzrd_dynamic_reconfig(): min_t() result was not assigned back
>    to value, so the cap to WZRD_DR_MAX_INT_DIV_VALUE was never applied
>    before the register write.
> 
> 3. clk_wzrd_get_divisors() and clk_wzrd_get_divisors_ver(): If rate is
>    0, DIV_ROUND_CLOSEST_ULL divides by zero. Return -EINVAL early.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

This needs some Fixes tag(s) and Cc for stable. Also this, and the last
patch needs to go at the beginning of the series to make it easier to
backport to the stable kernels.

> ---
> (no changes since v2)
> 
> Changes in v2:
> - New patch
> 
>  drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> index 7fe8d0d4cfba..046efa5c77c9 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -303,7 +303,7 @@ static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
>  	value = DIV_ROUND_CLOSEST(parent_rate, rate);
>  
>  	/* Cap the value to max */
> -	min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
> +	value = min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
>  
>  	/* Set divisor and clear phase offset */
>  	writel(value, div_addr);
> @@ -341,6 +341,8 @@ static int clk_wzrd_determine_rate(struct clk_hw *hw,
>  	 * achievable
>  	 */
>  	div = DIV_ROUND_CLOSEST(req->best_parent_rate, req->rate);

The Sashiko feedback looks legit here regarding the u8.

Brian

-- 
Brian Masney <masneyb@kernel.org>

