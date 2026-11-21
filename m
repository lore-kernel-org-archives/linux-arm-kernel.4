Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112FF606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 06:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BTaNeQ7m;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=yt/wcE0V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WCE0vUfhS0MhPYOM4DRo/ve5dejGQTzGK0Aug4NmRXQ=; b=BTaNeQ7mEUBz/LifDTsHfQ/+DG
	hg5vIciJBFcvDyvnmsz/QVHk/jUjru9PBISefQrvqSXQoHOMM3apTBdsY+THi+oPBRLgnpBa/ZnXk
	tX6glcwv2S4FCkhPmDZaGfQ0nV+99jAnQS85VYtb1dyc+FeNtiDmi7d48UhiJrknnytudWs0ikhtM
	uPmzOmNooaMzLDg5NMvuRpbDF6DmveLRvj6P2GZnsZ2TtvfymcaW0ukFdBOoOopEVIvLfLl0k02EG
	1I1m682cVOJw5OxDxABi3pkmS+huAhOHXeWODfFHbMisgZzPvR4zylqvgv91hyajD1qN76gcE2hg+
	b46iVGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUefT-0000000GnuQ-44TG;
	Sat, 21 Nov 2026 06:33:47 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUefQ-0000000Gnt5-3a3v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 06:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795242816; bh=WCE0vUfhS0MhPYOM4DRo/ve5dejGQTzGK0Aug4NmRXQ=;
	h=From:To:Cc:Subject:Date;
	b=yt/wcE0VqUe3YStJRPZ64ruksnzgz5e5T3jmDUlwhR6IWTVR/bNblcjNvVD/4p9LF
	 Ec1p/8XI7iv7oASsB+aFKC5aZmTpM9/BoJY/FdDcYfBPSvitVLI1eZve9fl88V4FdV
	 cD4AS2VuwwTwcrGnTUDUYZ/44uVDfsEmbuH3faCU=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 86136C4F; Sat, 21 Nov 2026 14:33:33 +0800
X-QQ-mid: xmsmtpt1795242813t2sx48k49
Message-ID: <tencent_5995CC7B942E7CD204E49AE7AE32164BAB09@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjSJ9wQXs34T/QCnXRQN1WHKrDU0AzKxo+oPpQOEt6oaKnTYBun0
	 dhvk7l0VVzmWluLRZUV2IobXFwWimg3+dCrdNAqANIm/ZlYYeyrpFvHKeJduD/9yS8OtbK72EPhs
	 jN73tWTYZUQNQCAv725uvIGjmsbZJUx0puQF9D6RX65exj+s2nlJZYVXMIeoQQVNZ8Ev1Hufw0/C
	 qZ0aUcDa/Z1FE+ZolIkZNHBBJ0moqEpnYor+6xbq2CfU9WI6DVicRtZBVAkOFd4vPdr/aWfc1IOp
	 NkIdWmIAi5CJ6Ychu651fWd80ykyDJLPOG0ge51CjvV//mZ8zKMeq479QVb3UqOenMFGEEc/AZ8V
	 SISR7e/JwYnKxD4oTzptfHDFs6t1iYKB771+wmLZHYagFndpNvFJ9l+XNmy2Ob6nAfdEryvXRPVi
	 uVwqhZzsUMgq5W2VXZkymaKt4RwUfR9qGzKRf1CecRNvxvh52KiC7ofapyscIvxLaGY0JJyr3tYF
	 D3/mn4iO6lA9qV0X9P+lk2TAr3LmUlvJLaljktBDjkJ6z+QsEfFzBrCO9U8u0hD+VcrXzQKPsPi5
	 iQwt7xWU81zcsk9E48Vwe1HlhoN3NLHfXAQtFXaoueB3vrtPA/bQXGVZYcFlrVM7rk6u1VYKptbi
	 Wb7MtiJbtW1z4n7gYxLXbjl1GWJZCpYB74i03GRNf4NEImzYexSrRYCQK+940Xil6BiWBtRfzLKx
	 CzGyGp8NLSVAk8vBfXFs/IRfq9gZVPUA+aoVHyX50AIfQgB2WsHSPdJzeZHjeWNh4Qv2dQ98yv5G
	 LofJFsdTT2ULQzuJB64nqLbW8SgnSfbtPrA2t3sFm2vJIN7u3TRNwXT7CtQ9WS4V9yKE0M6G7BcL
	 3UdcYngiz8FLby2LpJfy2EpMfPL6QysM+dvF/1b06CcNxX02fIzwHy6xRF9LVei8UojHx5sIEgCM
	 MY1jRwGcLMTNx6OCmorD4aaGe0NXnMIZFbG81F1oetvmm3ODNEGyC97g+sdMp7ov/bhEG7sUD12G
	 wSqj0WOeWiSS3RHrZHADNtyoBwOPYeDeeRrGFgEdx2cuMaXulRASi144AeL9EWXMWYrvAFOf0LBw
	 ul5hI8IEyjGdMvDr7xktyeeLjshe6jLbkyIIxMGLG95gUEobFAyb+oxqIkqDGiX6RS7KMkl++8l2
	 05qfSB0I4pXA81Hw==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: ZhuXiangyu <1194781887@qq.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 1/2] thermal: rockchip: add RK3506 TSADC support
Date: Sat, 21 Nov 2026 14:33:29 +0800
X-OQ-MSGID: <20261121063330.1094548-1-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_223345_349892_16564A6C 
X-CRM114-Status: GOOD (  20.46  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RK3506 TSADC is based on the TSADCV13 register layout and provides
a single CPU sensor channel. Its analog front-end is enabled through
the GRF and the controller needs the TSEN clock for the sensor analog
supply.

Add the chip data, the conversion table, the initialization sequence
and a suspend callback that turns the analog front-end off while the
SoC is suspended. Also grab the optional TSEN clock so that it is not
disabled as unused.

Tested on an RK3506B EVB: the thermal zone registers successfully and
reports the on-chip temperature correctly.

Tested-by: ZhuXiangyu <1194781887@qq.com>
Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 drivers/thermal/rockchip_thermal.c | 101 +++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
index 5e327039..fbfd78a6 100644
--- a/drivers/thermal/rockchip_thermal.c
+++ b/drivers/thermal/rockchip_thermal.c
@@ -104,6 +104,7 @@ struct rockchip_tsadc_chip {
 	/* Chip-wide methods */
 	void (*initialize)(struct regmap *grf,
 			   void __iomem *reg, enum tshut_polarity p);
+	void (*suspend)(struct regmap *grf, void __iomem *reg);
 	void (*irq_ack)(void __iomem *reg);
 	void (*control)(void __iomem *reg, bool on);
 
@@ -146,6 +147,7 @@ struct rockchip_thermal_sensor {
  * @sensors: array of thermal sensors
  * @clk: the controller clock is divided by the exteral 24MHz
  * @pclk: the advanced peripherals bus clock
+ * @tsen: the sensor analog clock, optional
  * @grf: the general register file will be used to do static set by software
  * @regs: the base address of tsadc controller
  * @trim_base: major component of sensor trim value, in Celsius
@@ -165,6 +167,7 @@ struct rockchip_thermal_data {
 
 	struct clk *clk;
 	struct clk *pclk;
+	struct clk *tsen;
 
 	struct regmap *grf;
 	void __iomem *regs;
@@ -210,6 +213,7 @@ struct rockchip_thermal_data {
 #define TSADCV2_AUTO_PERIOD_HT			0x6c
 #define TSADCV3_AUTO_PERIOD			0x154
 #define TSADCV3_AUTO_PERIOD_HT			0x158
+#define TSADCV9_Q_MAX				0x210
 
 #define TSADCV2_AUTO_EN				BIT(0)
 #define TSADCV2_AUTO_EN_MASK			BIT(16)
@@ -220,6 +224,7 @@ struct rockchip_thermal_data {
 #define TSADCV2_AUTO_TSHUT_POLARITY_MASK	BIT(24)
 
 #define TSADCV3_AUTO_Q_SEL_EN			BIT(1)
+#define TSADCV3_AUTO_Q_SEL_EN_MASK		BIT(17)
 
 #define TSADCV2_INT_SRC_EN(chn)			BIT(chn)
 #define TSADCV2_INT_SRC_EN_MASK(chn)		BIT(16 + (chn))
@@ -246,6 +251,10 @@ struct rockchip_thermal_data {
 #define TSADCV6_AUTO_PERIOD_TIME		5000 /* 2.5ms */
 #define TSADCV6_AUTO_PERIOD_HT_TIME		5000 /* 2.5ms */
 
+#define TSADCV13_AUTO_PERIOD_TIME		2500 /* 2.5ms */
+#define TSADCV13_AUTO_PERIOD_HT_TIME		2500 /* 2.5ms */
+#define TSADCV13_Q_MAX_VAL			0x3ff /* 10bit 1023 */
+
 #define TSADCV2_USER_INTER_PD_SOC		0x340 /* 13 clocks */
 #define TSADCV5_USER_INTER_PD_SOC		0xfc0 /* 97us, at least 90us */
 
@@ -255,6 +264,10 @@ struct rockchip_thermal_data {
 
 #define PX30_GRF_SOC_CON2			0x0408
 
+#define RK3506_GRF_TSADC_CON			0x0010
+#define RK3506_GRF_TSADC_TSEN			(0x10001 << 8)
+#define RK3506_GRF_TSADC_ANA			(0xff0007 << 0)
+
 #define RK3568_GRF_TSADC_CON			0x0600
 #define RK3568_GRF_TSADC_ANA_REG0		(0x10001 << 0)
 #define RK3568_GRF_TSADC_ANA_REG1		(0x10001 << 1)
@@ -526,6 +539,17 @@ static const struct tsadc_table rk3399_code_table[] = {
 	{TSADCV3_DATA_MASK, 125000},
 };
 
+static const struct tsadc_table rk3506_code_table[] = {
+	{0, -60000},
+	{362, -60000},
+	{395, -40000},
+	{503, 25000},
+	{604, 85000},
+	{672, 125000},
+	{757, 180000},
+	{TSADCV3_DATA_MASK, 180000},
+};
+
 static const struct tsadc_table rk3568_code_table[] = {
 	{0, -40000},
 	{1584, -40000},
@@ -863,6 +887,40 @@ static void rk_tsadcv8_initialize(struct regmap *grf, void __iomem *regs,
 			       regs + TSADCV2_AUTO_CON);
 }
 
+static void rk_tsadcv13_initialize(struct regmap *grf, void __iomem *regs,
+				   enum tshut_polarity tshut_polarity)
+{
+	regmap_write(grf, RK3506_GRF_TSADC_CON, RK3506_GRF_TSADC_TSEN);
+	usleep_range(10, 20);
+	regmap_write(grf, RK3506_GRF_TSADC_CON, RK3506_GRF_TSADC_ANA);
+	usleep_range(100, 200);
+
+	writel_relaxed(TSADCV13_AUTO_PERIOD_TIME, regs + TSADCV3_AUTO_PERIOD);
+	writel_relaxed(TSADCV13_AUTO_PERIOD_TIME,
+		       regs + TSADCV3_AUTO_PERIOD_HT);
+	writel_relaxed(TSADCV2_HIGHT_INT_DEBOUNCE_COUNT,
+		       regs + TSADCV3_HIGHT_INT_DEBOUNCE);
+	writel_relaxed(TSADCV2_HIGHT_TSHUT_DEBOUNCE_COUNT,
+		       regs + TSADCV3_HIGHT_TSHUT_DEBOUNCE);
+	writel_relaxed(TSADCV13_Q_MAX_VAL, regs + TSADCV9_Q_MAX);
+	if (tshut_polarity == TSHUT_HIGH_ACTIVE)
+		writel_relaxed(TSADCV2_AUTO_TSHUT_POLARITY_HIGH |
+			       TSADCV2_AUTO_TSHUT_POLARITY_MASK,
+			       regs + TSADCV2_AUTO_CON);
+	else
+		writel_relaxed(TSADCV2_AUTO_TSHUT_POLARITY_MASK,
+			       regs + TSADCV2_AUTO_CON);
+	writel_relaxed(TSADCV3_AUTO_Q_SEL_EN | TSADCV3_AUTO_Q_SEL_EN_MASK,
+		       regs + TSADCV2_AUTO_CON);
+}
+
+static void rk3506_tsadc_suspend(struct regmap *grf, void __iomem *regs)
+{
+	/* Disable the analog front-end while the SoC is suspended. */
+	regmap_write(grf, RK3506_GRF_TSADC_CON,
+		     RK3506_GRF_TSADC_TSEN & 0xffff0000);
+}
+
 static void rk_tsadcv2_irq_ack(void __iomem *regs)
 {
 	u32 val;
@@ -1280,6 +1338,29 @@ static const struct rockchip_tsadc_chip rk3399_tsadc_data = {
 	},
 };
 
+static const struct rockchip_tsadc_chip rk3506_tsadc_data = {
+	.chn_offset = 0, /* cpu sensor is channel 0 */
+	.chn_num = 1, /* one channel for tsadc */
+	.grf_required = true,
+	.tshut_mode = TSHUT_MODE_CRU, /* default TSHUT via CRU */
+	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
+	.tshut_temp = 95000,
+	.initialize = rk_tsadcv13_initialize,
+	.suspend = rk3506_tsadc_suspend,
+	.irq_ack = rk_tsadcv4_irq_ack,
+	.control = rk_tsadcv4_control,
+	.get_temp = rk_tsadcv4_get_temp,
+	.set_alarm_temp = rk_tsadcv3_alarm_temp,
+	.set_tshut_temp = rk_tsadcv3_tshut_temp,
+	.set_tshut_mode = rk_tsadcv4_tshut_mode,
+	.table = {
+		.id = rk3506_code_table,
+		.length = ARRAY_SIZE(rk3506_code_table),
+		.data_mask = TSADCV3_DATA_MASK,
+		.mode = ADC_INCREMENT,
+	},
+};
+
 static const struct rockchip_tsadc_chip rk3568_tsadc_data = {
 	/* cpu, gpu */
 	.chn_offset = 0,
@@ -1383,6 +1464,10 @@ static const struct of_device_id of_rockchip_thermal_match[] = {
 		.compatible = "rockchip,rk3399-tsadc",
 		.data = (void *)&rk3399_tsadc_data,
 	},
+	{
+		.compatible = "rockchip,rk3506-tsadc",
+		.data = (void *)&rk3506_tsadc_data,
+	},
 	{
 		.compatible = "rockchip,rk3568-tsadc",
 		.data = (void *)&rk3568_tsadc_data,
@@ -1736,6 +1821,11 @@ static int rockchip_thermal_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(thermal->pclk),
 				     "failed to get apb_pclk clock.\n");
 
+	thermal->tsen = devm_clk_get_optional_enabled(&pdev->dev, "tsen");
+	if (IS_ERR(thermal->tsen))
+		return dev_err_probe(&pdev->dev, PTR_ERR(thermal->tsen),
+				     "failed to get tsen clock.\n");
+
 	rockchip_thermal_reset_controller(thermal->reset);
 
 	error = rockchip_configure_from_dt(&pdev->dev, np, thermal);
@@ -1815,6 +1905,10 @@ static int __maybe_unused rockchip_thermal_suspend(struct device *dev)
 
 	thermal->chip->control(thermal->regs, false);
 
+	if (thermal->chip->suspend)
+		thermal->chip->suspend(thermal->grf, thermal->regs);
+
+	clk_disable(thermal->tsen);
 	clk_disable(thermal->pclk);
 	clk_disable(thermal->clk);
 
@@ -1842,6 +1936,13 @@ static int __maybe_unused rockchip_thermal_resume(struct device *dev)
 		return error;
 	}
 
+	error = clk_enable(thermal->tsen);
+	if (error) {
+		clk_disable(thermal->pclk);
+		clk_disable(thermal->clk);
+		return error;
+	}
+
 	rockchip_thermal_reset_controller(thermal->reset);
 
 	tsadc->initialize(thermal->grf, thermal->regs, thermal->tshut_polarity);
-- 
2.47.3


