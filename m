Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CEC606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 03:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gS3fV6sv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFFLZ4Jq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=r58Dxg2tgGyxD4PA+pT7yN68kQNPSN5LuMe4YebLPx4=; b=gS3fV6sv59cIUi9qm7GeyrVkA2
	dZ+K5WRD0Ud4l9UEZZe9Ojce78ocWkmGWk1TQuYlu4f8DjjivPqfhnjd1DJVqgHdjcJOt7ZyKQ40C
	WtQyvNdea1w8RIaWdvs1nd6UWIklfwx5Likm+Niy6wen9NF5ZNKVEcYW7BSCaUgboibpEk5NLVVxV
	4DPlqjvweYIKLofyb1eaB1QFYqMDGGwaIxvnI3KlGfVHYdGSGANw2ILEQlDyUd0kbz3T9znyZgy96
	smPh4dDqskxurH8fCxiqdMsBk/fSevKGLaMCd4/6zeahy3tTpmsMEzVrrCAcKzB8zX8ppHAF51MQm
	tcmMYEYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3uz-00000008JY5-3noX;
	Wed, 25 Nov 2026 03:43:37 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3uv-00000008JVV-17E2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 03:43:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso51634525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 19:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578210; x=1796183010; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r58Dxg2tgGyxD4PA+pT7yN68kQNPSN5LuMe4YebLPx4=;
        b=zFFLZ4JqBX8naW3YKXtII15oAuGr+18DkNZqSsvhl66Af9xB4/FmLh0OEdaGigL7t+
         mTmxLO0ndbWLj9El353LiugOWKrENP8/GPwNeCEHvp6o1D/sMxUhPp+XT5WaiKiwORrs
         UJ5BNY+Wjhf+ZbEMNhK9kTUUu+Ir0YoBm9pINcS7AW/gVfGtB69+cZCAj4H+7vDBNSXb
         TCcemhcLeX68IN/bidr0X8Vxl/Hq7xmt6esRtuF3pLf38hlBX2mz7QhEjLLdcySvN/XU
         rpxMuXB8IoR0LbFxKyBDgZ3VFqYjsMm9jiN+kVLgsfFv3W+vPmcUlm4US8I1YmgAfv2b
         0ItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578210; x=1796183010;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r58Dxg2tgGyxD4PA+pT7yN68kQNPSN5LuMe4YebLPx4=;
        b=phrQx8v7xbbWV3whtsA61/+X7PRqHedj2mTlxfe0yfFDtE7+wA9Wh0RYK6cMVBi0Tc
         4F+9fAw20nYNF59hUkqjz85e8w1w6kro7YvmzhUDBQkeSLYBoVDQCyETXGAmPmUJ3juN
         OsLxzrTd4h4QY7TDylpBUIMynXREvBk9PssuQR3uklF2ix2qJ9kwUVo2iTX/xOhSs7wy
         azvj9Bcimt/ZZ0Mq4pYZTiLYmFdrAzyAP4utABlpSFuSK+7dcVI9HI//JIV64Y31LKUP
         66XHFYSgFMBHJwgjQVs+j0k6YV3T/WKOonFb297dcxzuUVwUE5EbLLtXiRYyNVdPx2Av
         wrqg==
X-Forwarded-Encrypted: i=1; AL+hErHEqYy0z8B8ruwHVaroRXUnsOOWek8jlQLqvDbUGT9dcgv2I1rVGyzsyRdbJvSIHzrKN+HgCk4S/Xbf4e7nn2JY@lists.infradead.org
X-Gm-Message-State: APuU4Z/GlkDqh0lVfV7R+4kymBvmogRHEP1ubuAShNWbnakgoIZyLtt9
	srtdcrSXBZglJcT9RhoLD30TJ9GhqP0UndF8wL5Pq8nq+DAB8obMvVFY
X-Gm-Gg: AZFdTZcLL3qyTjJhxBP0MmJt+ht/n+O7OXyIKakRQVkDDVpe5mtOwHkhQLxgYD0HmF8
	Xf1SrjAo+jXHo/6AsQmFXYuxRdRZNvG8kLaloGjOgRrzByFbTAmu1CgIXgK/btSZJNLGD6aymLu
	ebXDgS4am2819/8sfegvNU126Tftq+odxdTJ3L1DAjxXYAJRfX74bDFVw2zcVUC6NJLCDmWPYfW
	LFMhrUeqe5ZzNQiZzGAeKQq8brEFCYoUEWZ1v7R47BI3siRwtu3qsgVlRiREvSE6z2sdzGYizld
	1M5pwJGATPYDB1a652TbP6rL77mIAE3ywmFTRIXXYjGusOFG3FPj9yx68XH70s/MSp0wGj4878J
	IJceTb6WCkrEp608gZpiTKK+9gyE3l0hj7J73QYIuZ3pq1vCx215O/fdMlFiT7c5VuO7B7/SJBQ
	9k13D+B1hq6AKaU4Q5+TU+HU7qq15ceBjzRVS++mC22hz3RxgVsUwWorwEShUT2Mg5B5Zy8Byyj
	vaHU34Q7piNaS5zoDxPcWbMhn2Z1cRF36Tf4PU+yPrLxp29DHYtF+R6Q1ngUnFqhzIULOpmsuu7
	gg2w2YlWFXhGFEeMMD27hxIbCqAMaqL8YXQ0gg==
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb888226c0mr405465545e9.27.1795578210149;
        Tue, 24 Nov 2026 19:43:30 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v3 00/14] Add initial support for Qualcomm Halliday and
 Samsung Galaxy XR
Date: Wed, 25 Nov 2026 03:42:56 +0000
Message-Id: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEJZBmsC/4WR2W7DIBBFfyXiuUQwBgxWVeU/qj5gGBJaL41xr
 EZR/r3YsZRuUl+Qhplz7ywXknCImEi1uZABp5hi3+WgeNgQd7DdHmn0OSbAQHHOND3Yponenqk
 fE0WFvrBQS+cZycj7gCF+LHLPL7c4nepXdOOssVYMeDxln/FWdrepNr9NxqZtaQDJilLkDLJqE
 uRrb39BrnmjhQJuWBBBel9N8C8TnaNKWikE1KilWZkWU7Ir9HijoKBH17c09S52oc+pvApax87
 Hbp/oBJRRIZlw3KFWxu76lLbHk20y1G7z8zQL1zYhnX/iWG0wGIC6BG4lGlMIHRwPUjMePNYCS
 kQuEE0g804PMY39cF4uNvFlhes45vtxJp47AW04F7bW3JS7fWtjM7ewCOUJ7zBXP+B5DHAGRKG
 dckJ9ha/X6yeVRL2YOQIAAA==
X-Change-ID: 20261108-halliday-dts-e6ed3a2b5cd0
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=6234;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=azYIy7Z40yIDlSuh5Mz7oT8vPni9I9knitlR28s/doo=;
 b=c4hT+PD3H1S/NG0t/y9kGVB5kkO7YV/E1HObCKHUAhFxdB4WxSWz/1gZuM/CZn7D0I4dGm0NR
 6uXdXdBlMaYB5Q4KJ33WFtgDmbPylfAcJ2vCwPNZyO/Ahtphyi5BZfH
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_194333_350404_807B075F 
X-CRM114-Status: GOOD (  19.45  )
X-Spam-Score: -2.0 (--)
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TRACKER_ID,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series introduces initial Devicetree support for the Qualcomm Halliday
(SXR2250P / Snapdragon XR2+ Gen 2) and the Samsung Galaxy XR headset
(board compatible "samsung,xrvst2").

With this DT and the driver series, the headset boots to an initramfs
with a shell over USB NCM.

UFS, cpufreq and the thermal zones work too. PCIe with Wi-Fi and more
will follow.

Dependencies:
- The dts patches need v4 of the Halliday TLMM series and v2 of the
  clock series:
  https://lore.kernel.org/r/20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com
  https://lore.kernel.org/r/20261116-halliday-clk-v2-0-28208928da36@gmail.com
- The dts patches also need the interconnect series, which is applied
  to the interconnect tree (branch icc-halliday).
- The SoC ID patch needs "soc: qcom: socinfo: Drop DT bindings with IDs":
  https://lore.kernel.org/r/20261123-qcom-socinfo-id-dt-bindings-v2-0-4504c1ce869a@oss.qualcomm.com
- The cpufreq series and the TCSR binding are applied to the cpufreq
  and MFD trees.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v3:
- Drop the TCSR binding, it is applied (Lee)
- Replace the qcom,ids.h and socinfo patches with one that adds the ID
  to include/linux/soc/qcom/socinfo.h, on top of "soc: qcom: socinfo:
  Drop DT bindings with IDs" (Krzysztof). Remove Konrad's Reviewed-by,
  because it was for a different patch.
- Rebase onto qcom/for-next, where that series applies
- The cpufreq series is applied and is no longer listed as a prerequisite
- Add the Reviewed-by and Acked-by tags (Krzysztof)
- Link to v2: https://patch.msgid.link/20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com

Changes in v2:
- Order the patches by subsystem, with the SoC ones last (Krzysztof)
- Squash the "halliday" codename patch into the board binding
  (Krzysztof)
- Add the SoC ID patches, which were a separate series in v1
  (Krzysztof):
  https://patch.msgid.link/20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com
- Move the OSM L3 binding to the interconnect series (Krzysztof) and
  the cpufreq-hw binding to the cpufreq series, so that each subsystem
  gets its patches in one series
- dtsi: Keep the Linaro copyright of sm8550.dtsi, which the layout
  comes from (Krzysztof)
- dtsi: Drop the empty chosen node (Krzysztof)
- dtsi: Sort the thermal trips by temperature (Krzysztof)
- dtsi: Put idle-states before domain-idle-states and
  arm,psci-suspend-param before the latencies, like glymur.dtsi
  (Konrad)
- dtsi: Use 0x0 for zeroes in reg, ranges, dma-ranges and
  redistributor-stride (Konrad)
- dtsi: Break the reg-names, interrupt-names, clocks and clock-names
  lists into one entry per line (Konrad)
- Cc Ulf Hansson for the rpmpd binding
- Link to v1: https://patch.msgid.link/20261109-halliday-dts-v1-0-289114ab8197@gmail.com

---
Stanislav Aleksandrov (14):
      dt-bindings: interrupt-controller: qcom,pdc: Document Halliday PDC
      dt-bindings: power: qcom,rpmpd: document the Halliday RPMh Power Domains
      dt-bindings: arm-smmu: Add Halliday SMMU
      dt-bindings: usb: qcom,snps-dwc3: Add Halliday
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add Halliday HS PHY
      dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Halliday
      dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday UFS
      dt-bindings: crypto: qcom,inline-crypto-engine: Add Halliday
      dt-bindings: thermal: qcom-tsens: Document the Halliday Temperature Sensor
      dt-bindings: firmware: qcom,scm: Document Halliday SCM
      dt-bindings: arm: qcom: Add Samsung Galaxy XR
      soc: qcom: socinfo: Add SXR2250P SoC ID
      arm64: dts: qcom: Add initial Halliday dtsi
      arm64: dts: qcom: Add Samsung Galaxy XR

 .../devicetree/bindings/arm/qcom-soc.yaml          |    4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/crypto/qcom,inline-crypto-engine.yaml |    1 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    2 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    2 +
 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    |    4 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |    1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    4 +
 .../devicetree/bindings/thermal/qcom-tsens.yaml    |    1 +
 .../devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml |    2 +
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |    3 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/halliday-samsung-xrvst2.dts      |  218 +++
 arch/arm64/boot/dts/qcom/halliday.dtsi             | 1871 ++++++++++++++++++++
 drivers/soc/qcom/socinfo.c                         |    1 +
 include/linux/soc/qcom/socinfo.h                   |    1 +
 17 files changed, 2120 insertions(+), 2 deletions(-)
---
base-commit: ef922b721a5e99348fc1f5801fdeb427ee14ee9f
change-id: 20261108-halliday-dts-e6ed3a2b5cd0
prerequisite-change-id: 20261108-halliday-tlmm-f250374110e0:v4
prerequisite-patch-id: 93f99b14fb93baf1aa68e010d29d463cfb616b9e
prerequisite-patch-id: f94f62e85a4afa1d5caf06ca16e2ea2abe1e99ed
prerequisite-change-id: 20261108-halliday-clk-362190f4f5dd:v2
prerequisite-patch-id: 765d40b7543dba6580852939a5c3d177f12d0a1e
prerequisite-patch-id: f12c958fceb125bcefd8dc9de139f30a371f85a4
prerequisite-patch-id: a6559b14fa1badec8e7752940362d68306523557
prerequisite-patch-id: ef47e531053032f65d3d600e2213c8a78e50f20b
prerequisite-patch-id: c4b2cbea76a00aeb699d706e09a899aa18e510d9
prerequisite-change-id: 20261108-halliday-icc-65a5442be859:v2
prerequisite-patch-id: 94cd5dee75e96876c6a42852cf6d1b52df1c7ace
prerequisite-patch-id: 9ad58176d603ffd84e7f1239c3b646cede4c8a3f
prerequisite-patch-id: a5df517be2541ab439d324dfe23ceb4c71a0e655
prerequisite-message-id: <20261123-qcom-socinfo-id-dt-bindings-v2-0-4504c1ce869a@oss.qualcomm.com>
prerequisite-patch-id: cba901b3668891005366e6c699866823187d2e6b
prerequisite-patch-id: 165b8370594197636821e98c434c0db01db0f953

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>


