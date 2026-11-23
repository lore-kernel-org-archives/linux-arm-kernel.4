Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABA4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0R6bdb9b;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sZXfdjud
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GH9PwUTkNOVR19n9V4pHtHTQ3cVhwyxReHCBvD2/+eY=; b=0R6bdb9bvoy1SK1auReNm+lT2n
	0KgImGvnoEwxol+trJTFwCZmVm+q4vFUOHUU93CiJ03JU6Uq/9NZ9od/nVIsavUr5kqUHHhvQ1WWi
	J9S7Wu5F9PwSkrmgyGCD8D5H7hkQoe+h7Y/zNl2JffIm6TyXO3una8nqFRii3IRwXfri7RnylMsif
	91424iyQMBaAkXdfUTgCY4YlnCLKi6fvrVduCujOWSawddAdpshw5KcioBkUUOHjGqk+4m5xrSe0d
	EhwlvwrcNcTiWMmZR5yB8YfeVtyM67ADomW0XkpY0zFyWoJQl9OTtW1OwkFyITT/+K5XRpTQHlY0b
	6rzOsT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXN6-00000004HF2-2bQM;
	Mon, 23 Nov 2026 16:58:28 +0000
Received: from mail-dl2-x07.google.com ([2607:f8b0:4864:38::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXMW-00000004H5Q-2bTu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:57:54 +0000
Received: by mail-dl2-x07.google.com with SMTP id a92af1059eb24-13985f8229aso2989234c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 08:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453072; x=1796057872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GH9PwUTkNOVR19n9V4pHtHTQ3cVhwyxReHCBvD2/+eY=;
        b=sZXfdjudEE0H91xmVXHkt04/zhVzcBYCDng9rz7Fmgu8CraQpHXXecR29/PHTjoSeA
         hhGKDU4Kr6A7y+TF34O//4nvZ4FnBt+BCecg3pYxmel0HEo+DgBKu4WFQVtk15sC9gRF
         sBS0AzPntns/Z1W2P2SvVta1pH6CfEUgVsFY1XQf+m1MXB+5MVoW/My04PHqyfAyF2cM
         6uc6h4PN7ZSGpChfEOoZPmyeQPHffH09b9pauVwxVVM8AxorQG5xbcUJ5AUMqqlpSB1m
         P81C7XcWDkx6mUN1Rg54G43VGaualxfPnsdGG11v6oNAZPTAyg/sKsT3lsXLoqQtgpr3
         L5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453072; x=1796057872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GH9PwUTkNOVR19n9V4pHtHTQ3cVhwyxReHCBvD2/+eY=;
        b=1APJQgcG6fIQQ0ro/IxpXeZuAJpo2mnR3IziSP4T6QECMinZCpRmH2uRlfQGJNUmBf
         eH84jhUBcfYseXwSAghY57zp5bMmWN4kR3YzMXmEFu4kDPOdF85vEKEOPgqn55mSuShW
         /UwBoNN2xDd1G3F73tttC+cCC2WMF6lXs4cqnB0/Frr/w0dWWzldSFwwUm8T+q8s9nyC
         d3W7HvWIuKqEb/P5Pb6hTLDrIVOL3BTBu9hrH5xkF4kmVe+7OACblbqeZLoBSKoTaixg
         PLMAbpnaN2y0lg0u5QcTyKYF+P5VHzIHZvE0YK9DoY1pK8P5y0AI1wen00GgB1TXykYw
         HxVQ==
X-Forwarded-Encrypted: i=1; AL+hErGmvhCqVJdyyfdilRMX+BU0/FkY4upuKAPxh71MsmTdIKcndSGrzzUpCZZurXcUS3w3EI7DPHNwVWz6po149XYG@lists.infradead.org
X-Gm-Message-State: APuU4Z+buaM8QFKc6kdumVlP/RBWD/BfAw/NAupribqhYbnaS3t5aHe0
	/uZSBkNVl+GM26FY34W7omtmBvyuFCy3sJsaqd3JkCq8zkLE6UaFhi6f
X-Gm-Gg: AZFdTZd/5hVSmO6XlAlBjOZgBahrN2W5gyUtYaSwgDrdWy0M4o82jek0rgURFmzBlE1
	9ew0VJmIDzp8+KvW46WnWYsAFVouMXSGh846ryohYx6a1iJfdaNEy7TJ7YavjVSnBQkxPDIac8x
	9PCoMbJ4myd5DeLsdGHodCRqsJc6rQc+FDRU8Ghzwfw8n61ahTYEHBNa62FbjzC7f4Rq4fzrIJA
	wpPW+N9hyRIeM0vU5iwJq+C68ONecOfDZyb8Q6qqZbF2drVMGGEbK4r/zbEE9AnsY3jg1gbtfLB
	gH7TGE4qvKuJi1zH+TUk+xXPNLwTthUt3c8y/0H6Vu5SdeVx9q10xxM8qQlbOj91YgUTPZR+4MC
	lkQXMb1U9oi2IKSdtoHURFW3vRlTsTVtmt4ewRS3np9+ILjYZVcufU7wB2auWpXwBMGJtEV+i+R
	uLV+5VS7hNoCBgQtCjn5iP402HUNKwZR4+1x6MlJ2z18c3/yjZTzjg2CP0jwEPciF3+xAUXJzCa
	yG+BsxvQbmk3iG+l/YOIwhbcjqlCCnhhDP3VxBwmqSig3qJiKmn9OnRwomAvgnhWDF0nzsBAxck
	gasBpuVGwvSzL8dzOJxhyBaihNiKWrjvCqNHCbtp2bd6JZLN5KVCnOaXzFA=
X-Received: by 2002:a05:693c:8957:10b0:386:b089:3520 with SMTP id 5a478bee46e88-386b0893ad4mr3583969eec.19.1795453072013;
        Mon, 23 Nov 2026 08:57:52 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm13315280eec.0.2026.11.23.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:57:51 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v13 0/3] arm64: dts: rockchip: add RK3568 XPCS nodes and enable SGMII on Photonicat
Date: Tue, 24 Nov 2026 00:57:00 +0800
Message-ID: <20261123165703.667564-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_085752_674237_388CCEE7 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the RK3568 XPCS node, describes the RGMII PHY LEDs on
the Ariaboard Photonicat, and enables the SGMII LAN port on the same
board.

Changes since v12:

- Move the XPCS reference clock from the SoC dtsi to the Photonicat
  board dts (Heiko).
- Set rockchip,sgmii-mac-sel = <0> now that the PHY binding has landed
  in linux-next.
  https://patchwork.kernel.org/series/1180426/

Previous version:
- https://lore.kernel.org/all/20261023053548.1595033-1-coiaprant@gmail.com/

The XPCS node is disabled by default and is only enabled on boards that
use SGMII.

dtbs_check passes with the current linux-next.
---
Coia Prant (3):
  arm64: dts: rockchip: rk3568: add XPCS node
  arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

 .../boot/dts/rockchip/rk3568-photonicat.dts   | 75 ++++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  9 +++
 2 files changed, 82 insertions(+), 2 deletions(-)

-- 
2.47.3


