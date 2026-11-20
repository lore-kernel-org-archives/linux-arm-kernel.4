Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4253606A6F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=19fHBeMI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KqFDA992
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ba1LZYpNSjXVJ+zOLl8k2Tar0vWRwRjXeVxP97+SFE0=; b=19fHBeMIzFGPuzIDvBRkke5wjC
	LJoJC4jOmmXy0xAHVWR3YQ2XnvevsJgp/rkhKgiz07UtF5nImFzBg1hb5Q9GqeYLRJJBTg3N9QDIH
	aPnIDKNrVuukgmsECVpFRUeqlGkhlz6vN6t7RS/Z1Ggj9x/EkxSBjNnX5+10M9f/Fa7lze7lrfcWj
	CiOHWOcrAG7BbS8g22KltDrc3KHeIYopgKX/afccwrJmHWHjERpne5TCVYCuZT6ewMy5jG+3/ATyQ
	lmvPAaE4j2Sbxp0on8dV571Idmrv2UaGzZfXpQTkV1qGsd6dWCfw20xdhlkIBbyuJjzo3cfzVlR90
	Z9VdeKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUAh-0000000G3te-1kZa;
	Fri, 20 Nov 2026 19:21:22 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUAa-0000000G3qo-1FyB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:21:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so598128f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202466; x=1795807266; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ba1LZYpNSjXVJ+zOLl8k2Tar0vWRwRjXeVxP97+SFE0=;
        b=KqFDA992TyQxOcqtCt9Gj+kvzy7280R5zjFNxoiXmuxfFf1h+miHTzGxrQFdvOUldI
         NEDCLjJJhDmibM4XssmM7O/KWOrXFPOBfmMg+fjchokPkvNz1q/ftWBV3PoG/fX1fPTx
         oCINkCMpqIc1jvvmCWJDHHl7yeRvxBYMNWloI4lePkzbSlMob1LsXwizgTJS+i5BWqBP
         sHdz/tU0ECWGLJMwb+fStq0TapW/0EIzFWr0qXnicnNxf+eDBnM0cFnwn2jode0nWQcu
         ntxnMzo/QG63xjbBKr6Hr2dqShiANPvPOd8bUYNk/woSMybks4feoi9kNaAEFBSMrt74
         bn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202466; x=1795807266;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ba1LZYpNSjXVJ+zOLl8k2Tar0vWRwRjXeVxP97+SFE0=;
        b=bFOYVCo3cUbsKUGzUDUxRMfgX+SS8rlvxGFPpdfejRMekvP+JkWnA7KgRNZorunUmS
         +HciLz+B6OuMrLD4Mrr8c4/457LDx+rVJEN5r4Hy95ZESBrPk4MF6c9L5TJqjJgdcGye
         0dRVcE5nck0MPbXc5CnssUlo6yYq0gB5rBSAdRZlOMeqbKPf0pI8EbEIBs0oEMmqJai1
         pMFf7F/RHly+MgXnGYNGzCsPtZ6QwT0Akbc6gKOzG4DP01+QDtoFiUFpZkfjTGHx8Li/
         YpG4rmNw6FC3/ivvvJT/UWjjBhj+g3eMtuBA+z9RcGpv5xqTeC5VzO0IV5BzuxsjiCX8
         qjug==
X-Forwarded-Encrypted: i=1; AL+hErF1hmGuXQ0xqpPXhE/Y8VmxHfkaOjg2ss1yu5mPISX1yno5XfFvfw1pOl8TmvghN0Nh1eFkEdwQlzoWmCOVo+f7@lists.infradead.org
X-Gm-Message-State: APuU4Z/0V6VAgLcfBjM6TQ8xrILBG3o4saMNKB2lGkdKIpPRwhOl3rvV
	O8thWOVYU4cAUEvFRZct/2xSrc9AQQVLFhhPBvtI90PIBV8W35D6rmfD
X-Gm-Gg: AZFdTZdqwd3yIedU7l6cTyZuh3S67H1XpVDdW6Fc0Fc0ceSiMxeInxx14NzXT0Ro2PU
	5zSq4v5+IpzO9Kb9/wPlMGa/t7YouV5WTiAqxpZ18TLiQKWsJvpXehv5k4SDs6U57tdDCbHE1Zh
	pUIIW/TbJEXoPwkPbPeAJ5lyg+MMr9f0S9I86tcJiw3ueGKAgFEwD72TK5a+aiXGK3RIyKitk+e
	7hOMKVxhhJT2/Fr70+E8QOcKP1A5v6BKRnDpB/rT3djM+4LOT+SpKy5ZRcXMkFY2vwcAAazJzkT
	msnJJW45ffwiysuBwiyCfBKx97S93sFPwZdDKMaU2wzEbBhxM4EOANdWwSwe3GDgwqoBQyP/KNn
	i39kHZWxxV+sNdVTq9jKRLRc/0yIDI/7JU604YyaHblxpgNPY+nTisaFlF03LlSo96eYkBpp2ne
	3Px2hwGhOFc7ycs8cCsdVOnCYZj+jUChmviAVbXSS9y2qeTOckUmY6PfjV9KwzwASovHokKu8nm
	qIi9gEa8ssFYXmBDNAkTDbOcE8hLzdXbwJ3PiTbRxvzdQH2qdxOTw8Zf2kpOseZZ+fLCjj80NyA
	b8gqC+984jBs0Atag68ve2fQv2JnmalcahIfUuHt
X-Received: by 2002:a05:6000:4541:b0:48c:4658:602b with SMTP id ffacd0b85a97d-4abb400bbf3mr6410831f8f.10.1795202465920;
        Fri, 20 Nov 2026 11:21:05 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:05 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH 0/6] ZTE zx297520v3 USB support
Date: Fri, 20 Nov 2026 22:20:49 +0300
Message-Id: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WOXQ6CMBAGr9Lss036I2B7FcNDW1atCmhbCJFwd
 yuQ+DjJ7Hw7Q8TgMYImMwQcffR9l4EfCLib6a5IfZMZBBMl57yin0moIVrqpFHM2ELJ4gjZfgW
 8+GktneuN42Dv6NLvfDcCvoc8kTbtv6DJ1mente+eDyotq6RVjRBNqUe+blgTkbq+bX3SpMMp0
 f0tBfWyfAEDtdoxzAAAAA==
X-Change-ID: 20261117-zx29usb-c3a90ab59354
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3961;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=FWQb+bD4+CzUS89QtQFZvvJ9rtMw5c8LSvVgJ2lgW6o=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2WLxQfwJwf3UU2/2ZG/baKj8e+AcifMVpgO
 DzUx5mh4amJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIY7BAAjh6uYVRLaiV6bbaXmSFHRPt6/PfvQKT
 vnjZ0TnBwX/y9aoG++Jm4tUH+wbRUU8ehmzojZRpUZ7JXcHDq55bO1AyB5pOaH57BIN4gZIebfh
 r3LdzDmBhjlXwe6Jq1Vh6M1lGMqj7zOnCUkA7KAhKFT5V/i+o/Ho4HkU++cMFmF+uakN5UA65O8
 MrhBnKtCvBafYQgDA0S2Y7hMRfUvWfPlXGTzi94rCBZE9CX6JzvyZW625HI+vhLRchX1cxvm1JK
 J6auyg2Bc6BXE+DlDcGvmmGzfUt+gvNcGVIBTkb+c+AMnkARc/IkZ8o3LgPowZEeXWp8+bYE5Cg
 /zT+Te6JV6qqnCopAErFnF5Wn9Vrobq++ZPlG35Sbp8BJIzVKaE9Wwlzz+hRR5NrFd6B7FpVDVv
 DzHCDbvNOL7+6T9JsExO1mMskdl7JiWSEJyjKcAAG9IZaeNBwRG8yaaKK0Y6eDzLcn6kG5V8EeU
 ic88V1VXgF+UA/OlSAMJ2U/6AfzTjnmDGRbrnkaeGP7CnsW64JDQD1kz1eQMWl7okCNKuDEwSpN
 g7fHe91pG8duQy7BZQvncNoS2Zm2MO3h5UZ02gvAaH+Dn69f6VNM01R4Fxd6lhD7BZ+31sPRrPi
 fs3Dug01rMorlaA8eUHw2y3MjpEiul4iA3bwKz/s9BChfh2WolHk=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_112112_961527_28C8D798 
X-CRM114-Status: GOOD (  23.38  )
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series expands the device tree and drivers for the zx297520v3 board
enough to enable the DWC2 USB controller found on this board. This
series depends on the zx29clk MFD driver that has been accepted into the 
MFD tree, but not yet merged into linux-next.

The individual patches contain a description of what they do and the 
rationale for design decisions. Here is a quick overview:

Patch 1: DT bindings for the node containing the necessary power controls
Patch 2: Add the socsys node to the MFD driver
Patch 3: The power domain driver
Patch 4: A minimal USB PHY driver
Patch 5, 6: Link it together in the DTS

Dependencies: 1-4-5 depend on each other at build / DTS validation time.
2, 3, 4 are build time independent but need their previous patches to be 
enabled at runtime.

The MAINTAINERS additions are going to cause issues though. Once the 
patches have been reviewed I can either take them out or create an 
immutable branch.

The open questions:

1) How much documentation is appropriate in the binding .yaml?

I want to document the identified registers *somewhere*, and since the 
yaml lives in Documentation/ I put it there. I do understand though if 
the Linux kernel doesn't want to be a backup SoC datasheet.

2) Power domain vs reset:

The pm domain controller has a reset, isolation and power register for 
each of the 5 (maybe more) devices it controls. My binding links them 
together into #power-domain-cells.

To start up the GSM controller, its driver will have to assert and 
deassert the reset. The GSM controller (Derived from an Infineon 
PMB8877) has a self-arming watchdog and after 2.5 ms it stops 
responding. With the power domain it is somewhat awkward:

devm_pm_runtime_set_active_enabled()
pm_runtime_get_noresume()
pm_runtime_put_sync_suspend()
pm_runtime_resume_and_get()

And hope nothing else is holding the device and that runtime PM is 
actually compiled into the kernel.

Life would be easier if I expose the GSM reset bits as #reset-cells. 
Otoh, I'd prefer not to do that for USB, as USB already has 3 different 
reset controls already and adding another is awkward. I could of course 
also hide the USB reset and expose the GSM resets.

For now I postponed the issue and don't add GSM related controls to the 
bindings at all.

---
Stefan Dösinger (6):
      dt-bindings: soc: zte: Document zx297520v3 socsys controller
      mfd: zx297520v3: Add socsys to the mfd host driver
      pmdomain: zte: Add a zx297520v3 power domain driver
      phy: zte: Add a zx29 USB PHY driver.
      ARM: dts: zte: Declare nodes to enable the board's dwc2 controller
      ARM: dts: zte: Declare the HSIC controller node

 .../bindings/soc/zte/zte,zx297520v3-socsys.yaml    | 100 +++++++
 MAINTAINERS                                        |   3 +
 arch/arm/boot/dts/zte/zx297520v3.dtsi              |  42 +++
 drivers/mfd/zte-zx297520v3-crm.c                   |  12 +
 drivers/phy/Kconfig                                |  11 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-zx29-usb.c                         | 183 +++++++++++++
 drivers/pmdomain/Kconfig                           |   1 +
 drivers/pmdomain/Makefile                          |   1 +
 drivers/pmdomain/zte/Kconfig                       |  15 ++
 drivers/pmdomain/zte/Makefile                      |   2 +
 drivers/pmdomain/zte/zx297520v3-pm-domain.c        | 286 +++++++++++++++++++++
 include/dt-bindings/power/zte,zx297520v3-socsys.h  |  11 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   2 +
 14 files changed, 670 insertions(+)
---
base-commit: d785d132202e8e8e93335ebf74ad5b29fca0951f
change-id: 20261117-zx29usb-c3a90ab59354
prerequisite-change-id: 20261108-zx29clk-3b073b9d22d6:v14
prerequisite-patch-id: 3ea4ed11578625d6aadf59c5b542e788882eab2f

Best regards,
--  
Stefan Dösinger <stefandoesinger@gmail.com>


