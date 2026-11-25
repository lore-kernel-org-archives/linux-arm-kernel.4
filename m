Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50881606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MK/9lVtw;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CDg8zK4m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XcsPi3qvnIrsdxjh28gNxRodworsSCcyn+GNHNwrRhE=; b=MK/9lVtwae6jbS
	kesIhRpT0+3hxjN4L96hPte2FdqfFR99z9oZ6Jun4JdApTVgjlCWcXlh4Y9av8t7whG4Ej5Z1JzBA
	dChLqmrmvsamRSu55JbZrvpTwrmHFoCN+zTfW5mVgExhHmqvRdLg51W81HmX8FaHeN0HN6AOp7jXO
	31Ol/MxjxFqWaUn7g6RL8FADztJ0k8pp+5Io1/S7+7LJ31LT4JejYpFoytLhrGpfM/qlIYECZBfXF
	jy3szuL8hyiDSGIZJjSV7OxscCdOLOvKGWKzXHQ2syZbPtS7ExkX1Fu6S9KP/41Do+NfsNSTAu1Dv
	bdvJsnh8dNnyJkioqX8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDud-0000000A978-1330;
	Wed, 25 Nov 2026 14:23:55 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDuS-0000000A91I-04FG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:23:45 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e47347279so3530622f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616622; x=1796221422; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcsPi3qvnIrsdxjh28gNxRodworsSCcyn+GNHNwrRhE=;
        b=CDg8zK4m2SZosehNzmlwHInCsLGWVCJ1yDzlkEGpe2fuYYCXVw7WeftUrsnkOZdbM2
         dw9gQ7f70F3lvhu7QUgHPvHqtceRQOVW50aCfQJLpo8vDnIb+pzs/fxMCqosjCR82fJ/
         e3fe0twrc10QWhSz670KlYFjPWUtrO2qY3Iovi01io2pSaaZJQKhy40ckChQHEgOwfLq
         dqKjGxMDcCleOfBNHHK1kfPUdRrmtAKHcDkLgrRdEXk2T+nmhZYDk0hiVrjvFoz4qjGx
         /wulo8JB6FONXwTbgZKtPv6qiGLqaQzrGY0vXIvGrdqngxBXN9U02AbDLBjnsdHGEPrR
         bOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616622; x=1796221422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XcsPi3qvnIrsdxjh28gNxRodworsSCcyn+GNHNwrRhE=;
        b=eHrhbk70o1SJEsQNb+YX0/1H4SNBXLUctgefG/QPuzSJRu7KVTmSidwXiYm8r+hErB
         vMLyLbFWK7yDOATtEvMio707UpULuklG9qOwfEdXQWE7mosntBT3B7lLkL6++QX3KPva
         dL74H8NGGq73JH67sRfA7ZWOxHxka/463k7xRIocAoAXk7UNxPpMfmUvTyvrC6unLyj9
         HwBxm1vPSoH4juwR3sMiExTFd3ADrnAtQLuPIYDMeBxhXe9QDgwtD/Hao87X6EVc3gVh
         gR2smZohaBbxMvlNXAP+YpCFpHS3tlqgbPmdCKtXQp27PiqxHfyhLae2ISQ5KLEHy3Al
         Fsow==
X-Forwarded-Encrypted: i=1; AL+hErGLtqGKJvI7dehsCp6hWUS8puKBrCVGojof5eGNi5+Rua9YC+x3T/0ybg5mHKM5wdpjQfrSbp+2aqeFZX7k+7KT@lists.infradead.org
X-Gm-Message-State: APuU4Z/cp89kyvv2b2IERm4N5JNst0Llu0z0DqraE7N2NNkRXzS13zaq
	TWPjYHzAjYmz31SQ0WZo4g5cVp50Pbo6OMAr7nn0DUmn7CoAtFny00T7dg2lCBFOTXWy4hiRoYa
	tftH7XzE=
X-Gm-Gg: AZFdTZeNUimQl6LmEVONCTMCbRQjKmttA4szyYApDT6lMcbxcnxFskdA615hrhDCStm
	1uHXaDdaOE5uA4neY4NQhLYxnk4GublCRrruPkpgONeTE02Vv36p/2wrwo0qKsjSyH6M2mlhIcD
	oOdEHfhLVIW1wTmbpx/QL4ldL6wmsgVsS8E/YexWn2hlB+jENiSr/TkChWoozwL71kVcG1pYxha
	Jnd8A+aD5NJ9Sq5i+dgbMQNg5SK2aR/ihXRqKmcVF0oJWnXssAN8vwjynKMB6n6Wb/Gz62Kxy9y
	qMdIWTg3U88hw1uwlb3pqW2KPd6xqRLoMbBCazQ7ZPNBYZJp3XUUI8RcfAheD7ixSbK+iDTxqRZ
	aUn0/W10wpQMFlb9leHcv1uOJME5H7EUk7kLYsbRNhU9DTDfVyiTbEguGwmd446ekGwHUu392kQ
	yFUc/RlSdKjf+F1agcQ+K9G/JExYKBpiZS1nOY9f1iec92hEC9MOEQ3eum9VsmfeuKvoHqYSy9R
	jbZrPfr0eOiqjy26dvwoLxnawp9ar0zU2UOWbFiPrG2/s2BqfKdjEcXJp++3b1JplJPvxWkU/g0
	S9JD+HWW+nMscVmZJ4t+de5WsyLHDFC6dUHM1Rk4kzIHESyxXtOac4pEBPTJNXUsbvFiQyOhlHr
	PckRSA/ynsSRkmv8ygQG7DQ==
X-Received: by 2002:a5d:428b:0:b0:49d:78ad:a2ec with SMTP id ffacd0b85a97d-4abb47b1ba6mr27250862f8f.25.1795616622030;
        Wed, 25 Nov 2026 06:23:42 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:41 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:34 +0000
Subject: [PATCH v2 2/5] iio: adc: exynos_adc: add ->read_value() callback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-exynos850_adc-v2-2-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 Sam Protsenko <joe.skb7@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_062344_111508_D118B981 
X-CRM114-Status: GOOD (  15.53  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ADC data register offset differs between SoCs. In preparation for
adding Exynos850 support, abstract reading the conversion result into a
->read_value() callback in struct exynos_adc_data.

Add exynos_adc_v1_read_value() for the existing SoCs and use it from the
interrupt handler. No functional change intended.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/iio/adc/exynos_adc.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index c1a0061b16ca..a1124a418f29 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -133,6 +133,7 @@ struct exynos_adc_data {
 	void (*exit_hw)(struct exynos_adc *info);
 	void (*clear_irq)(struct exynos_adc *info);
 	void (*start_conv)(struct exynos_adc *info, unsigned long addr);
+	u32 (*read_value)(struct exynos_adc *info);
 };
 
 static void exynos_adc_unprepare_clk(struct exynos_adc *info)
@@ -195,6 +196,11 @@ static int exynos_adc_enable_clk(struct exynos_adc *info)
 	return 0;
 }
 
+static u32 exynos_adc_v1_read_value(struct exynos_adc *info)
+{
+	return readl(ADC_V1_DATX(info->regs)) & info->data->mask;
+}
+
 static void exynos_adc_v1_init_hw(struct exynos_adc *info)
 {
 	u32 con1;
@@ -252,6 +258,7 @@ static const struct exynos_adc_data exynos4212_adc_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos_adc_v1_data = {
@@ -264,6 +271,7 @@ static const struct exynos_adc_data exynos_adc_v1_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos_adc_s5pv210_data = {
@@ -274,6 +282,7 @@ static const struct exynos_adc_data exynos_adc_s5pv210_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_s3c64xx_start_conv(struct exynos_adc *info,
@@ -295,6 +304,7 @@ static struct exynos_adc_data const exynos_adc_s3c64xx_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_s3c64xx_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_v2_init_hw(struct exynos_adc *info)
@@ -356,6 +366,7 @@ static const struct exynos_adc_data exynos_adc_v2_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos3250_adc_data = {
@@ -369,6 +380,7 @@ static const struct exynos_adc_data exynos3250_adc_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_exynos7_init_hw(struct exynos_adc *info)
@@ -395,6 +407,7 @@ static const struct exynos_adc_data exynos7_adc_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct of_device_id exynos_adc_match[] = {
@@ -484,10 +497,9 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
 static irqreturn_t exynos_adc_isr(int irq, void *dev_id)
 {
 	struct exynos_adc *info = dev_id;
-	u32 mask = info->data->mask;
 
 	/* Read value */
-	info->value = readl(ADC_V1_DATX(info->regs)) & mask;
+	info->value = info->data->read_value(info);
 
 	/* clear irq */
 	if (info->data->clear_irq)

-- 
2.53.0


