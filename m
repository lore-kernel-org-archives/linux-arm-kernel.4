Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AC260A5BCD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z1LuMcXj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlsumMSR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5eh6B0MLrnUtM1Hc34WhByD1VEsYF+myuR17nVrgwTI=; b=z1LuMcXj1sTZPn02ucMBEsQrFU
	3GZ6vzaWiFVVXrOKi3MJiA15WTBv1CaaiqZlzDpvKj5xpY6j/9QJDUjekQ67la1dfVunCxHTnHBIi
	GgHFvbxdtz7DhmZhxxpQaciEa/4SsWVD4I23N1cyTqcXCrWUUxLTIWhpj7nefg/lDUUjij+VX+7Cf
	bk6DWAzEV1tP/HmsVJ4bLM993s4wDS3tRIjN4a/JrmlKXQNzLvKsC+zxebtsDvb6DyFNUnX2AK3T/
	QzvLbzINqW15SlGS13mwK+75NxmQlw2O97DO9cxhtapmn3eiPjlbMBoW63r7J4HOzH/cjH3nSLuL2
	5yK8GMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe6j-00000002USa-378X;
	Tue, 10 Nov 2026 05:09:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe6g-00000002UNK-40QE;
	Tue, 10 Nov 2026 05:09:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 06AE1636E0;
	Tue, 10 Nov 2026 05:09:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794287357;
	b=yumHOzCRMs8sHBEz52MhzjBCbwtwhWf3OZ4lrjS6MtCiG7xRiN+9iJn9JavSPDVJzG5r
	 5x1xPp6njAEtbP+NVHlqrCs0VBXQ7cR2aIVZehff309GMDTsW0G3UH/Dv1ls3CrzAhOEv
	 rrLkWbA7PxydFz/TQO/b6jaBTqmbyirFJPJb9GVqf0/2Gc7RIytSOTpOaZ0QxfShwYtSI
	 GSXnEn3TzkPgwVIcC6tUQpOHmYKPlsneK4xB6By2s8NQtmumUazOgo3n6nd25EXtSfaPV
	 408UUchlkB25Y/GHz0gnFoLSm8OH165XH/hTl/1+R1q5l4Mp6GIJyVpxke8TJC/lL0A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794287357;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5eh6B0MLrnUtM1Hc34WhByD1VEsYF+myuR17nVrgwTI=;
	b=naQDEH1GEbAUy8dNvQNV9pZBSOuE0tKkZOKU4YiQw0jmfhwbi8Fceut0Q5RUHtVSQvtB
	 XMxqjGJ6fhVpHqa38CLoDKUkRcRWxoNVx0izerlOGN3pVVfkPpEV8GtGI5ZiQcddqJSRW
	 DAEvaZ/CTWYCnjsSdLGdWRz6w6get8nPCOsIW3260p3LYANRKfl2FQFs2izA1o4RUNXBK
	 aVbBE5fnMBNjDpTGi0NzBo+esBsqZb3ZUAns9a/1TvJ2QgmeGlRNfae2+YxXuGrDIUyyk
	 iTbnKZsrQzyX5xhrk/+ph2pz5XXZi7Txo+ZvTlES84owhOLSaGkxF/urACzZANtyXfg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 232881F008BC;
	Tue, 10 Nov 2026 05:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794287357;
	bh=5eh6B0MLrnUtM1Hc34WhByD1VEsYF+myuR17nVrgwTI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=HlsumMSRzOd8b/Ndw43VWODGK/zVLZFF7zluYWED7TqTzsgAkz3yGwarBtq1CQzc0
	 fedChpXXszO4rHuTRQj01v5R9CGmecR16dOFrXr2g2U+X6hGQNVC6Kb5P1+V/HUy0e
	 Ab/rjxxEXhclfIcIqVG7geQ36NF5HeWKPsBmKG0s0iL15aVT7wUd03XlD8d+RA2358
	 8N9JFrQ98b4h6xzHbowkuWtY8sAz28lb6QR9q5Bhn/uo3+8THyEppL+jn4DPGwlQx/
	 2KJ1/J/WP2coQ9g0BQ5XHLOshmRpssTx07i5VRCw+Esyrjx8+14j6QjEz1oTTdq64+
	 6C0oh2YHRozIg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7954848871;
	Tue, 10 Nov 2026 05:09:16 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 10 Nov 2026 05:09:12 +0000
Subject: [PATCH v2] pinctrl: amlogic: a4: Allow functions without groups
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-debug-info-v2-1-73ad7aa0874b@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAPim8moC/22MQQ6CMBAAv0L27Bq22hI9+Q/DgZYtbCKUtEo0p
 H+3cvY4k8xskDgKJ7hWG0ReJUmYC6hDBW7s5oFR+sKgamWIaoM929eAMvuA1uri+GQaaqAES2Q
 v7312bwuPkp4hfvb3Sj/7d7MSEtamcdppffYXunXTIwziji5M0Oacv4gh8L2mAAAA
X-Change-ID: 20261106-debug-info-bb5611e36717
To: Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794287355; l=2644;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=sWD7zbg1mSXOEg9K8sOVvNf5EChgrS2CCVGEpGmu0uo=;
 b=Bn+UorY0bcUbavYtuQe7WCJiVKPEGNSMK8QgR2s6loKCX7ROkp3eRi8Rgestk9kEQdi97vDnV
 gPVKPwqjHjMCFU6ZIImK8Ma4yH99sq5pnmF1eeZVaotV47oXxU4ZJuA
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Allow function nodes without child groups during device tree
parsing instead of returning an error.

Only count and parse nodes with the "func-" prefix as pinctrl
functions, ignoring other non-GPIO child nodes.

This allows the driver to support function nodes without
groups and avoid treating unrelated device tree nodes as
pinctrl functions.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Add debugging information for error dts and Error pinctrl config not affect normal pin work.
---
Changes in v2:
- Reserve banks nfunctions and ngroups no-zero judgement and update commit message simultaneously.
- Link to v1: https://lore.kernel.org/r/20261106-debug-info-v1-1-067c5c554f91@amlogic.com
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 39eb8cc7fc0d..bd12f6fa3d4d 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -821,8 +821,10 @@ static int aml_pctl_parse_functions(struct device_node *np,
 	func = &info->functions[index];
 	func->name = np->name;
 	func->ngroups = of_get_child_count(np);
-	if (func->ngroups == 0)
-		return dev_err_probe(dev, -EINVAL, "No groups defined\n");
+	if (func->ngroups == 0) {
+		dev_dbg(dev, "func %s No groups defined\n", func->name);
+		return  0;
+	}
 
 	func->groups = devm_kcalloc(dev, func->ngroups, sizeof(*func->groups), GFP_KERNEL);
 	if (!func->groups)
@@ -899,8 +901,12 @@ static void aml_pctl_dt_child_count(struct aml_pinctrl *info,
 		if (of_property_read_bool(child, "gpio-controller")) {
 			info->nbanks++;
 		} else {
-			info->nfunctions++;
-			info->ngroups += of_get_child_count(child);
+			if (!strncmp(child->name, "func-", 5)) {
+				info->nfunctions++;
+				info->ngroups += of_get_child_count(child);
+			} else {
+				dev_dbg(info->dev, "func node defined err %s\n", child->name);
+			}
 		}
 	}
 }
@@ -1166,10 +1172,11 @@ static int aml_pctl_probe_dt(struct platform_device *pdev,
 			}
 			bank++;
 		} else {
-			ret = aml_pctl_parse_functions(child, info,
-						       i++, &grp_index);
-			if (ret)
-				return ret;
+			if (!strncmp(child->name, "func-", 5)) {
+				ret = aml_pctl_parse_functions(child, info, i++, &grp_index);
+				if (ret)
+					return ret;
+			}
 		}
 	}
 

---
base-commit: 89edcad9f23925f5706b7555b02165d1990444d5
change-id: 20261106-debug-info-bb5611e36717

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



