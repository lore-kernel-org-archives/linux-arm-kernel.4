Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04046606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0mk4D/0y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NAsaO+rq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/GxAQGaEwzuX7tT/z6HzIcfgj7yuN8Fe3RLWWhNbZcg=; b=0mk4D/0yApRQcp
	sVk4HhM4Sca7HICvULJTskSc+4Q5RvEB3RkCzJr7wM1aGq3qYY9i+lHHDH7XpKZOVTxwRgSiz1Ne9
	OqtnA0JZfq4qu7OESuJtstThVOuBnx1y9gUko7z/BVEQSur5h+zM20esFHNi2Oc5bSTEZIrDrsIV1
	2mXzqgQSuEGojzypdYmEuezJ/8gxMJxkWV8SmZfoOXTh339nHYaP73+cShhCA1u0Dt3CEHTArhwpV
	Ds/yREX48wko9NA+8fnvNm3HGcieYCpNYfdfY50DjbrfdbRYk59gc024pFmN0qRI4BDWPOuDgQKnd
	XMirchx9S9UrSeKXy9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXj1-0000000HOCb-3iBN;
	Sun, 15 Nov 2026 10:44:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXiw-0000000HO9g-3DGA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 10:44:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 378AC61C66;
	Sun, 15 Nov 2026 10:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967BE1F000D0;
	Sun, 15 Nov 2026 10:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739477;
	bh=/GxAQGaEwzuX7tT/z6HzIcfgj7yuN8Fe3RLWWhNbZcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NAsaO+rq1NJkVk+g8hwTEEfuKVPWB1kCkrQ27jjit92bSyqgfm619PjvQkRN7lYgX
	 SUhAv7uGGZThvFiZIYSk3ZLWsnTcyExXFdXkExUjMSaHDAZjyEESSn+Z/thOZeuouk
	 2S2ISS/Y3Ip52nFF1L/Ed+3+jPC9FplJo6CCcxtXGzBi0AE6LCdXTufthln2uj/0U7
	 xUHVOChwTXE+7HjNk1MJrg81MyD1J3t4fb0lYRoYrI0aQti+rbkUznF3skAVMkv2az
	 xi9Xm0WoNsW0juIx6EAEK/GsAy/RP+J7KK+8GfN2JqqizrX7DJUmEw8hvy1Z2uB3Zl
	 UZ5T4XbvLX0vg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 04/13] pinctrl: berlin: add optional pinconf support
Date: Sun, 15 Nov 2026 18:23:43 +0800
Message-ID: <20261115102401.3520-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Add pin configuration support for newer Synaptics SoCs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/pinctrl/berlin/Kconfig  |   1 +
 drivers/pinctrl/berlin/berlin.c | 234 +++++++++++++++++++++++++++++++-
 2 files changed, 230 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/berlin/Kconfig b/drivers/pinctrl/berlin/Kconfig
index 9b1644d1d4ea..abb1c912b9ba 100644
--- a/drivers/pinctrl/berlin/Kconfig
+++ b/drivers/pinctrl/berlin/Kconfig
@@ -3,6 +3,7 @@ if (ARCH_BERLIN || COMPILE_TEST)
 
 config PINCTRL_BERLIN
 	bool
+	select GENERIC_PINCONF
 	select PINMUX
 	select REGMAP_MMIO
 
diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index a0ae75b1d705..0edf9d5a2a7b 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -7,12 +7,15 @@
  * Antoine Ténart <antoine.tenart@free-electrons.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
@@ -20,9 +23,24 @@
 #include <linux/slab.h>
 
 #include "../core.h"
+#include "../pinconf.h"
 #include "../pinctrl-utils.h"
 #include "berlin.h"
 
+#define PINCFG_DS_10BIT		GENMASK(3, 0)
+#define PINCFG_IE_10BIT		BIT(4)
+#define PINCFG_PE_10BIT		BIT(5)
+#define PINCFG_PS_10BIT		BIT(6)
+#define PINCFG_SL_10BIT		BIT(7)
+#define PINCFG_SPU_10BIT	BIT(8)
+#define PINCFG_ST_10BIT		BIT(9)
+#define PINCFG_DS_8BIT		GENMASK(2, 0)
+#define PINCFG_IE_8BIT		BIT(3)
+#define PINCFG_PD_8BIT		BIT(4)
+#define PINCFG_PU_8BIT		BIT(5)
+#define PINCFG_SL_8BIT		BIT(6)
+#define PINCFG_ST_8BIT		BIT(7)
+
 struct berlin_pinctrl {
 	struct regmap *regmap;
 	struct device *dev;
@@ -56,6 +74,8 @@ static int berlin_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev,
 	struct property *prop;
 	const char *function_name, *group_name;
 	unsigned reserved_maps = 0;
+	unsigned long *configs = NULL;
+	unsigned int num_configs = 0;
 	int ret, ngroups;
 
 	*map = NULL;
@@ -75,11 +95,19 @@ static int berlin_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev,
 		return -EINVAL;
 	}
 
+	ret = pinconf_generic_parse_dt_config(node, pctrl_dev, &configs,
+					      &num_configs);
+	if (ret < 0) {
+		dev_err(pctrl->dev, "%s: could not parse node property\n",
+			node->name);
+		return ret;
+	}
+
 	ret = pinctrl_utils_reserve_map(pctrl_dev, map, &reserved_maps,
-					num_maps, ngroups);
+					num_maps, ngroups * (num_configs + 1));
 	if (ret) {
 		dev_err(pctrl->dev, "can't reserve map: %d\n", ret);
-		return ret;
+		goto exit;
 	}
 
 	of_property_for_each_string(node, "groups", prop, group_name) {
@@ -88,11 +116,22 @@ static int berlin_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev,
 						function_name);
 		if (ret) {
 			dev_err(pctrl->dev, "can't add map: %d\n", ret);
-			return ret;
+			goto exit;
+		}
+
+		if (num_configs) {
+			ret = pinctrl_utils_add_map_configs(pctrl_dev, map,
+					&reserved_maps, num_maps, group_name,
+					configs, num_configs,
+					PIN_MAP_TYPE_CONFIGS_GROUP);
+			if (ret < 0)
+				goto exit;
 		}
 	}
 
-	return 0;
+exit:
+	kfree(configs);
+	return ret;
 }
 
 static const struct pinctrl_ops berlin_pinctrl_ops = {
@@ -177,6 +216,190 @@ static const struct pinmux_ops berlin_pinmux_ops = {
 	.set_mux		= &berlin_pinmux_set,
 };
 
+static int berlin_pinconf_group_get(struct pinctrl_dev *pctrl_dev,
+				    unsigned int group, unsigned long *configs)
+{
+	enum pin_config_param param = pinconf_to_config_param(*configs);
+	struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	const struct berlin_desc_group *group_desc = pctrl->desc->groups + group;
+	bool enabled;
+	u32 val;
+	int ret;
+	u8 conf_bits = group_desc->conf_bits;
+
+	if (!conf_bits)
+		return -EOPNOTSUPP;
+
+	ret = regmap_read(pctrl->regmap, group_desc->conf_offset, &val);
+	if (ret)
+		return ret;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		if (conf_bits == 10)
+			enabled = !(val & PINCFG_PE_10BIT);
+		else
+			enabled = !(val & (PINCFG_PD_8BIT | PINCFG_PU_8BIT));
+		val = 0;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (conf_bits == 10)
+			enabled = (val & (PINCFG_PE_10BIT | PINCFG_PS_10BIT)) == PINCFG_PE_10BIT;
+		else
+			enabled = val & PINCFG_PD_8BIT;
+		val = enabled ? 1 : 0;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (conf_bits == 10) {
+			enabled = (val & (PINCFG_PE_10BIT | PINCFG_PS_10BIT)) ==
+				  (PINCFG_PE_10BIT | PINCFG_PS_10BIT);
+			val = !!(val & PINCFG_SPU_10BIT);
+		} else {
+			enabled = val & PINCFG_PU_8BIT;
+			val = enabled ? 1 : 0;
+		}
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		enabled = true;
+		if (conf_bits == 10)
+			val = FIELD_GET(PINCFG_DS_10BIT, val);
+		else
+			val = FIELD_GET(PINCFG_DS_8BIT, val);
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		if (conf_bits == 10)
+			enabled = val & PINCFG_IE_10BIT;
+		else
+			enabled = val & PINCFG_IE_8BIT;
+		val = enabled ? 1 : 0;
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		if (conf_bits == 10)
+			enabled = val & PINCFG_ST_10BIT;
+		else
+			enabled = val & PINCFG_ST_8BIT;
+		val = enabled ? 1 : 0;
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		if (conf_bits == 10)
+			enabled = val & PINCFG_SL_10BIT;
+		else
+			enabled = val & PINCFG_SL_8BIT;
+		val = enabled ? 1 : 0;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	*configs = pinconf_to_config_packed(param, val);
+	return enabled ? 0 : -EINVAL;
+}
+
+static int berlin_pinconf_group_set(struct pinctrl_dev *pctrl_dev,
+				    unsigned int group, unsigned long *configs,
+				    unsigned int nconfigs)
+{
+	struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+	const struct berlin_desc_group *group_desc = pctrl->desc->groups + group;
+	u8 conf_bits = group_desc->conf_bits;
+	u32 mask = 0, val = 0;
+	int i;
+
+	if (!conf_bits)
+		return -EOPNOTSUPP;
+
+	for (i = 0; i < nconfigs; i++) {
+		enum pin_config_param param =
+					pinconf_to_config_param(configs[i]);
+		u32 arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+		case PIN_CONFIG_BIAS_PULL_UP:
+			if (param != PIN_CONFIG_BIAS_DISABLE && arg > 1)
+				return -EINVAL;
+
+			if (conf_bits == 10) {
+				mask |= PINCFG_PE_10BIT | PINCFG_PS_10BIT |
+					PINCFG_SPU_10BIT;
+				val &= ~(PINCFG_PE_10BIT | PINCFG_PS_10BIT |
+					 PINCFG_SPU_10BIT);
+				if (param == PIN_CONFIG_BIAS_PULL_UP) {
+					val |= PINCFG_PE_10BIT | PINCFG_PS_10BIT;
+					if (arg)
+						val |= PINCFG_SPU_10BIT;
+				} else if (param == PIN_CONFIG_BIAS_PULL_DOWN && arg) {
+					val |= PINCFG_PE_10BIT;
+				}
+			} else {
+				mask |= PINCFG_PU_8BIT | PINCFG_PD_8BIT;
+				val &= ~(PINCFG_PU_8BIT | PINCFG_PD_8BIT);
+				if (param != PIN_CONFIG_BIAS_DISABLE && arg)
+					val |= param == PIN_CONFIG_BIAS_PULL_UP ?
+						PINCFG_PU_8BIT : PINCFG_PD_8BIT;
+			}
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			if (conf_bits == 10) {
+				if (arg > FIELD_MAX(PINCFG_DS_10BIT))
+					return -EINVAL;
+				mask |= PINCFG_DS_10BIT;
+				val |= FIELD_PREP(PINCFG_DS_10BIT, arg);
+			} else {
+				if (arg > FIELD_MAX(PINCFG_DS_8BIT))
+					return -EINVAL;
+				mask |= PINCFG_DS_8BIT;
+				val |= FIELD_PREP(PINCFG_DS_8BIT, arg);
+			}
+			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			if (conf_bits == 10) {
+				mask |= PINCFG_IE_10BIT;
+				if (arg)
+					val |= PINCFG_IE_10BIT;
+			} else {
+				mask |= PINCFG_IE_8BIT;
+				if (arg)
+					val |= PINCFG_IE_8BIT;
+			}
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			if (conf_bits == 10) {
+				mask |= PINCFG_ST_10BIT;
+				if (arg)
+					val |= PINCFG_ST_10BIT;
+			} else {
+				mask |= PINCFG_ST_8BIT;
+				if (arg)
+					val |= PINCFG_ST_8BIT;
+			}
+			break;
+		case PIN_CONFIG_SLEW_RATE:
+			if (conf_bits == 10) {
+				mask |= PINCFG_SL_10BIT;
+				if (arg)
+					val |= PINCFG_SL_10BIT;
+			} else {
+				mask |= PINCFG_SL_8BIT;
+				if (arg)
+					val |= PINCFG_SL_8BIT;
+			}
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+
+	return regmap_update_bits(pctrl->regmap, group_desc->conf_offset, mask, val);
+}
+
+static const struct pinconf_ops berlin_confops = {
+	.is_generic = true,
+	.pin_config_group_get = berlin_pinconf_group_get,
+	.pin_config_group_set = berlin_pinconf_group_set,
+};
+
 static int berlin_pinctrl_add_function(struct berlin_pinctrl *pctrl,
 				       const char *name)
 {
@@ -286,6 +509,7 @@ static const struct pinctrl_desc berlin_pctrl_desc = {
 	.name		= "berlin-pinctrl",
 	.pctlops	= &berlin_pinctrl_ops,
 	.pmxops		= &berlin_pinmux_ops,
+	.confops	= &berlin_confops,
 	.owner		= THIS_MODULE,
 };
 
@@ -339,5 +563,5 @@ int berlin_pinctrl_probe(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(berlin_pinctrl_probe);
 
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("pinctrl library for Synaptics SoCs");
-- 
2.55.0


