Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC1E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 08:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OPQY+dfl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YXpjp03n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=aFeYl4T8YSSyDpYz53OCJzQoOO6eMGhxEhZmG97u5pM=; b=OPQY+dflX0VXzjHltrhHkbglTY
	9NC+o5wS6zSaFqYFE+tCp+2oKOaqIGzjJO4aghDw8bsBygACK1c0QAOWOR5vTQ5nATtIlMiE/HYxk
	rdKMIGlZWZfQHNMvLD4Y4jEFO9UKrc58Wap3xrGRHvadJwtvrnD8TjqXPt6W7yRM+x4RmJmMgCt1D
	cCJB3prsC6QCSys0hxtxk6xCHKTTUuM05H+IHFFcWEz2clgcpsQYP7iRF4lxGXwOa6xz77kNnEArN
	+Na5sslhojC47+A/WCdt+HRrHCtTDSph7587GYLwbARGpWCGw+HaLvtzLNDDOjZjS7KV8U0yOQxMm
	GLQZKfzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVeM-0000000HEu2-3GOP;
	Sun, 15 Nov 2026 08:31:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVeK-0000000HEtv-1prr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 08:31:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F52F6141F;
	Sun, 15 Nov 2026 08:31:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794731503;
	b=RCm1fi/bqNf9QtzHIv8cjl5611YMFo3m83QDyBDXKg5Z+CfEtisyBMLkzMvdmBBBi2MJ
	 vGlZR5OpNdtwncrcm4VPP4X5rMAkOpxCaPNLN1jJ5XLqRQRdVgecGpSd2RiwBPt46Q/Q8
	 cHI7MC/JijIPb6u8kVD9f2yavnm0C47jGNiEzb30DJGxCHh4CXeTt2CclGXIzzSmV+flX
	 UkTHZhDdKM78M9EmZxiY1sAsIKjNKI/t0mqRpPSO27BmAHj/8RkF9wqhFajIBuRCWoxtU
	 PMSMZfv3NQEAwa0pM5U4nQ1BEmnngTYqBfauKERU6GZPbCZHMR6XeMHEmjTlRVDDCmQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794731503;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aFeYl4T8YSSyDpYz53OCJzQoOO6eMGhxEhZmG97u5pM=;
	b=O3QwJi5BmVSqmMaikZLDqbhsGj2xdq4szwfAf7IfEWFgLcdKsqQBK812wAljyN2Iz6ia
	 +Mt2rOxQ0O1abgVey8PbQwuEKyjIR0iaVhUpyrdpFYxWrtuDPfeI2xCj11I8CXTKjnhEb
	 tRncRhVktJkN/kJmeldeZq6UxMhEzx+0FksmQJ4h+0YAvnG36MGJZ/Np8wlJmX2mQDfKh
	 TanNBkTC6uLym+n+/gbduTc304fvh9/IY/ScwFY3Pl92yFF8xKwGYNxv5Y3P3ZOOwlg/i
	 KcJbuywnLv4DBMBQNvhNS6EGz1oV7RPE2ufHIppOeF0j4pwDlUkkfZ5fQrTKjWv06Rw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A32111F000C4;
	Sun, 15 Nov 2026 08:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794731503;
	bh=aFeYl4T8YSSyDpYz53OCJzQoOO6eMGhxEhZmG97u5pM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=YXpjp03nCUNQHMutdG82lQRp+51FuSkwy2Oi8jJAk9vOe33BLDS4OPXLtFYHBaeks
	 FFsgGsnjSg1x5X3aOqEEAW2zTSwXpIDq2AEecAda2BUXa7mUtiz0It5oj3YxmnQs15
	 gZ89vO56FTsz5PJWFpnUshZ339mD6v0a3Y62Y2g7xu4z8/lRAQ50ltU3iUAg88nzXr
	 GNNqEXKo6Tmj026fBD3x18KUxT/Oc7c7qj2K3+GYUeBSeDzWSkPBQiwRRSxOJX5vrO
	 nw73f5+CUUmHDsIcwCTNN6xdmA+K4wEel2ZHsM7zamrUYPj6twDazDJpHbQKj8f07C
	 zH3sOwsXOeQ1A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 06E3A49FE6;
	Sun, 15 Nov 2026 08:31:42 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 08:31:42 +0000
Subject: [PATCH] clk: sunxi-ng: h616: Gate the PLLs with their output
 enable bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-h616-pll-output-gate-v1-1-4cb3fc4d6c48@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDvg2BCIV5EuYjLVKaIhP1IQ7
 25sl9/ivQMSR+EEfXNA5F2SbGsFPRpws10nRvHV0LWdJiKFsyaNYVlwKzmUjJPNjM74p1dWtYY
 N1DREfsv3tx1ef6cyftjl+wXneQFswm10eAAAAA==
X-Change-ID: 20261114-h616-pll-output-gate-c9d3d4a409e9
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-clk@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794731501; l=5371;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=5Vv85VfVPju/Igwsb+cpuc7jYn8XWlxuDjDD7l4TQCg=;
 b=QCRHF0O3JplLAB6RsnHmUj4RBDxn54eIU3pvv4s3WPOBKl1ni4J/ys9QUw1OQKW1ERki6XpdX
 WcXhHQLNsjxC4yOr27rLRlEnzJtvn0NIrqp2V24ANDTjX/Rk8AxfZpV
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

Gate the H616 PLLs with the output enable bit (27) instead of the enable
bit (31), which powers the PLL down, as the manual (3.3.3.6) recommends
and the A100, D1 and A523 drivers do. Power them up once at probe.

On an Orange Pi Zero2, powering pll-video0 down at 453 MHz crashes the
CPU doing the write.

Fixes: 88dde5e23da1 ("clk: sunxi-ng: Add support for the Allwinner H616 CCU")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
No Cc: stable: the crash needs out-of-tree H616 HDMI. Tested on an
Orange Pi Zero2 (7.3.4 with HDMI patches): the failing mode set 40
times without an oops. Idle power not measured.

Developed with Claude (Anthropic); I reviewed it.
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 955c614830fa..da4156b39c2c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -36,7 +36,7 @@
  */
 #define SUN50I_H616_PLL_CPUX_REG	0x000
 static struct ccu_mult pll_cpux_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.mult		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.common		= {
@@ -50,7 +50,7 @@ static struct ccu_mult pll_cpux_clk = {
 /* Some PLLs are input * N / div1 / P. Model them as NKMP with no K */
 #define SUN50I_H616_PLL_DDR0_REG	0x010
 static struct ccu_nkmp pll_ddr0_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -65,7 +65,7 @@ static struct ccu_nkmp pll_ddr0_clk = {
 
 #define SUN50I_H616_PLL_DDR1_REG	0x018
 static struct ccu_nkmp pll_ddr1_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -80,7 +80,7 @@ static struct ccu_nkmp pll_ddr1_clk = {
 
 #define SUN50I_H616_PLL_PERIPH0_REG	0x020
 static struct ccu_nkmp pll_periph0_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -97,7 +97,7 @@ static struct ccu_nkmp pll_periph0_clk = {
 
 #define SUN50I_H616_PLL_PERIPH1_REG	0x028
 static struct ccu_nkmp pll_periph1_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -114,7 +114,7 @@ static struct ccu_nkmp pll_periph1_clk = {
 
 #define SUN50I_H616_PLL_GPU_REG		0x030
 static struct ccu_nkmp pll_gpu_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -133,7 +133,7 @@ static struct ccu_nkmp pll_gpu_clk = {
  */
 #define SUN50I_H616_PLL_VIDEO0_REG	0x040
 static struct ccu_nm pll_video0_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -151,7 +151,7 @@ static struct ccu_nm pll_video0_clk = {
 
 #define SUN50I_H616_PLL_VIDEO1_REG	0x048
 static struct ccu_nm pll_video1_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -169,7 +169,7 @@ static struct ccu_nm pll_video1_clk = {
 
 #define SUN50I_H616_PLL_VIDEO2_REG	0x050
 static struct ccu_nm pll_video2_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -187,7 +187,7 @@ static struct ccu_nm pll_video2_clk = {
 
 #define SUN50I_H616_PLL_VE_REG		0x058
 static struct ccu_nkmp pll_ve_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -202,7 +202,7 @@ static struct ccu_nkmp pll_ve_clk = {
 
 #define SUN50I_H616_PLL_DE_REG		0x060
 static struct ccu_nkmp pll_de_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
@@ -229,7 +229,7 @@ static struct ccu_sdm_setting pll_audio_sdm_table[] = {
 
 #define SUN50I_H616_PLL_AUDIO_REG	0x078
 static struct ccu_nm pll_audio_hs_clk = {
-	.enable		= BIT(31),
+	.enable		= BIT(27),
 	.lock		= BIT(28),
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(16, 6),
@@ -1214,6 +1214,13 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	val |= BIT(0);
 	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
 
+	/* Keep the PLLs powered and gate them with bit 27 (manual 3.3.3.6). */
+	for (i = 0; i < ARRAY_SIZE(pll_regs); i++) {
+		val = readl(reg + pll_regs[i]);
+		val |= BIT(31);
+		writel(val, reg + pll_regs[i]);
+	}
+
 	/*
 	 * Set the input-divider for the gpu1 clock to 3, to reach a safe 400 MHz.
 	 */

---
base-commit: 280af24c860569000b375edda6436ba8e3ee4b3a
change-id: 20261114-h616-pll-output-gate-c9d3d4a409e9

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



