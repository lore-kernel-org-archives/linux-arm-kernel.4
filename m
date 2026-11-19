Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53CC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a+P1AqqB;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=D7joHHEL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QBF+AGHQifO+3u233pASAlE3TnXlBjN6SI3Ox9FZ8jo=; b=a+P1AqqB6NZE5XkYBZ6g5bbCeV
	kBbm6nyBDAsRypkcE7XBQRfBNJ1E3pPJne59BXbVdLu7BlrULtpFcRCVuQEReaWRVnWdVU1mX+kFN
	7NOfcV8lQyfKXiUIFHRYvFruJMaA6rCz85TcRxHkzZDbJ/ZBDMEnZAtLmGvUTXeAFcGFINb6Okzha
	Q4zg/PZj254bZiEOBu363gSR8LYlcmDfvgqrmUTgRO6ed905jWK57RzgDb2po1Lm1/IhbN5JxqGzd
	2GXquIJr5riG2XMyeEN4u2S2/uZ6xWsqE8L+ztnAOqdAxRlkY1Qit4vF/6v1MSZ+rq58x7M+yAIpE
	/09rxcSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU29M-0000000C1e6-2sgH;
	Thu, 19 Nov 2026 13:26:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU29K-0000000C1cR-02qD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:26:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a210470b49so20721985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 05:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795094759; x=1795699559; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QBF+AGHQifO+3u233pASAlE3TnXlBjN6SI3Ox9FZ8jo=;
        b=D7joHHELXHzqLKIRZwl0rvrvur5KGJKG1uNy78gsKxxU7MvVrJQu+B6KTJjA1dm5UU
         0McT6DWIdKOgNFE/OQ5rK8ZWtP4Nxe01Uh6P25PbxPO4fhig61IgykafMcUwZiu1auvt
         PgXAXnSKcImLyAPVoNWUvBno+3TNGi40m5rc5wFQr7+ssIDwkPOKLn8zQcA9RfnrzCoK
         zI8htzRmNyFWo8bMwr3YZszhzPOFO7RdzyzFNcY520ih3DG9Qb+jU5ZQnIUerc2ADheJ
         AI4y1MgAdh9K8aXIh8iIdAzghQjN8APJ/GFNyLyQ11rXS1n/plbLBeh6IEh0YYjbirts
         vVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094759; x=1795699559;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QBF+AGHQifO+3u233pASAlE3TnXlBjN6SI3Ox9FZ8jo=;
        b=iFRci3Wywetw7U5ZYJyEwA+sTrw2h/wpQaML0quSQ+Qq2wG4OKDwl1RZNDQ4dPpGLR
         FAu+Ow9dNGyjBSPHGCiX7N51DwOf/RwdZxMKmAEqO8QhNuhACDdoHvCJ17MyJ6Yos4lJ
         F0pf+RwjnS2JTuMfNBwc3+zBcW8buwnPaF6md6gU6HXdsE0OHl+f2XQyKpUBdUFI3T5k
         s6Pxl931AE4AoVVn2zqDHcyaTvcw/5xj5MtX8vCdDTXTpPK/tb1kMpCrY1zcIKFEodTC
         ZRNNvBKgbr6bEewgFT89/GL+DDx1G8EL6o4q9SY+qg/fEpLuZ2u1LXCAcvUuxLPQooBJ
         vcKA==
X-Gm-Message-State: APuU4Z+VVqsrHG3WCDJrzUccHAf6+d7WzHx+fylyDV/JmKGeoQkLDmvL
	w0zGyMdHQsCEO70ZIN+5alCcEIUFg/4oKYLDo5bNCBb0uWURa9oOBb9NIvEuh/0nHGs=
X-Gm-Gg: AYBFou1n1dYjQv75wLUpSeJ/gFIQP69NUHzN2Ov6o2IsuGrC2st9/8v/qhcgLW4y8de
	4dPya9QifDvxVD0EoUskrdmYwyRBxo01jyrTFX1/rYAYEEDfzUM9IlSUu9hJAcR8Qh630jECGEF
	bZlC1OkG5Hbfj2ZoGBoxfaE0lYXqrzZ425sBcGQ5zFfIIh55KXZtBdaaHsRP5gHEH1hIUVHPQxN
	5O+G+d7f2XS3z3WEA9qjPZYTPDDfCCZyCZxNyg0mzCmkOBLDB/3zK4Tkd4aobzVUZbM9TIZPJr0
	sqmO9RBXfuGs4nTiXex3AnBxYLsz1vFj2dTfByW0bdryzu2fP/cEXc/eZg7EBcx70umQHCGKiqf
	KCIcyPxCCEr/MINzSmQs+9vfFziKLugfVPP/SigrHO1PJVtJlN6s9JTe0zG2xVdyE95e09veTty
	rxbnBH4Zs2eUgj9VeSFfV3FPi9DsfSkYNfi26XpTCSMnw42zXUF2PcTMSxfCfBq9CSDu9k3+cN2
	FnuqXdo0qt1FJynqE3JI1TW13ToFaXbl/aJ4ThYjMhpr59FsGzKQ9vAIcwIGeRrhkbdfbsQ3hT6
	z4c03vUyfauVvG6GHFE=
X-Received: by 2002:a05:600c:4f4e:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb7da0f671mr139545245e9.11.1795094759145;
        Thu, 19 Nov 2026 05:25:59 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84cc09b1sm33094945e9.0.2026.11.19.05.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:25:57 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Subject: [PATCH v2 0/4] KVM: arm64: nv: Fix AT emulation for nested
 virtualization
Date: Thu, 19 Nov 2026 16:25:33 +0300
Message-Id: <20261119-nv-tcr2-v2-0-3deb1a6cdba8@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWMQQqDMBBFryKz7oBJUbBXKV0k40Sni7TMWCmId
 29Scfke/78NjFXY4NZsoLyKySsX8JcGaA55YpSxMPjW9865AfOKC6nHbojuOqaOKfVQ1m/lJN9
 /6f442D7xybTUe13EYIxRQ6a5qjNUNez7D617AWCKAAAA
X-Change-ID: 20261119-nv-tcr2-59b13df5ecf6
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jintack Lim <jintack.lim@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_052602_093121_C50F1A14 
X-CRM114-Status: GOOD (  11.10  )
X-Spam-Score: -1.8 (-)
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

This fixes two issues in handling AT emulation for nested virt.
* VMs were potentially using the TCR2 bits which weren't intended for
  them.
* It turned out that guests could write to the TCR2 bits even when
  those were supposed to be hidden.  That is patches 2 and 3.
* The VMID wasn't handled correctly.  Roll over could happen before
  or during the AT execution leading to invalid results.

Changes in v2:
1) Sashiko pointed out that we need to restore the original TCR2
   bits at the end of the AT command.
2) Clean up based on Marc's feed back.
3) Trap the writes to the TCR2 registers (normal and nested)

Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
Dan Carpenter (4):
      KVM: arm64: nv: Fix AT emulation for TCR2_EL1
      KVM: arm64: Trap TCR2_EL1 writes when S1PIE or S1POE is hidden
      KVM: arm64: nv: Clear hidden TCR2 bits for nested guests
      KVM: arm64: nv: Update the shadow MMU's VMID for AT emulation

 arch/arm64/kvm/at.c                        | 54 +++++++++++++++++++++++++++---
 arch/arm64/kvm/config.c                    |  5 +++
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 10 +++++-
 arch/arm64/kvm/sys_regs.c                  | 33 ++++++++++++++++--
 4 files changed, 95 insertions(+), 7 deletions(-)
---
base-commit: 5a7235e9adff42aa043ac9473dbeb0354dca0967
change-id: 20261119-nv-tcr2-59b13df5ecf6

Best regards,
--  
Dan Carpenter <dan@pereq.eu>


