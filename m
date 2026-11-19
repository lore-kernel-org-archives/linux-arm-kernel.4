Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FD4606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r5avUIeV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G22BAcU6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yqFUUo+SlYOdbp1g0P3rZs/PIDm1rBIRBb+JwPIqgwo=; b=r5avUIeVAQMQn9
	yX4IoPRCoqTNn8VToUarfzbWzwq+qEX1FGjc17QNLVuleAqB9pdHgMy8cQ/gK5Ah9QAs4ioy/n8lc
	YFb+/7LZ6MszjQyORnuQer4zC49WGsfM6EfYxVqbDc152eff0SvltfSX4bZ5lRVjij2e3nuDdUDsS
	kKXTiC4VNMU7wkSRmV/CTfq0hESt+sI4qAUfCL0KtWKTFXtDgzJUUTBeUxaCH7fkhqa8aVuqvoMMl
	tRQhly3MOItkU0ChpE17Pnx/y46QpPSZNmTPzbWzNSr7CIJbw2lgqh6EXokMW+yxFa2opLx5FFMWO
	e7X6NEhoIrFwNzd/7FNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxwE-0000000BGEU-0ytU;
	Thu, 19 Nov 2026 08:56:17 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvc-0000000BFlt-1i3c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:37 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-5430f70c827so28607621cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078535; x=1795683335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqFUUo+SlYOdbp1g0P3rZs/PIDm1rBIRBb+JwPIqgwo=;
        b=G22BAcU6m1+f7bqaFl3J4T4bhfL0U3u2wHwlHGifw38MklwBs6G0rPHZ1Nk/S6rDbK
         s+BoGPUx02G7ghf3dGOhOiRzEYGUzTSznn2nKQ8bb813uyMb8a3cU/lOyWBI95LBZmBP
         t9riO1ViXYUyUR28d24cmyKABaevGGkONz01BU0ddim3DmCnmFQbHCN6nf2IJSSp0fKP
         nsJ2nu8oc1DT1weVWLov4DEDtdq4rAjvbiOjlBPG2fp5K1MW+4hmWUzmwp8iWbxelFzp
         0hwXe3G1DNlXofCXFepEq1X5QMgkyQWLtt7zHfYUlPOaNMTyBsPjCYSFhi0n7Csr8ZkZ
         cA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078535; x=1795683335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqFUUo+SlYOdbp1g0P3rZs/PIDm1rBIRBb+JwPIqgwo=;
        b=Aj/HhXThEWLAjsQWsowSHT0wmuw0H+lgedpS36WKA/hKq+7swwY90aeUL/srpzZM29
         dw19z/fPEwSm8dfPGpHvmc/W1tpva5VJKPkYMYAG1sYRV5ey98YaACb+Bml+nRg0UrDm
         hwH0OpTDj3cdummBkFqaaPCP1vewpitGkKI0O3iLOTldsomx6bLwgj2M5Mbu/t4209QM
         ewl7424nNc1O1oAQlCqfGTyyz0AzKdxCjMkIzQRUKUpTiAHXUjdgiAVVExR4WRb6F3ix
         425oBpdYIFW7VsxVCXAZHomHqP0K8MYMz5aZQHug0Xg91AoRlPxNP73IqCmPNcfJvdvL
         XqMw==
X-Forwarded-Encrypted: i=1; AL+hErGRSqkb0z5enCUvUS7UgB6bdDAdoVlHxt23+GcLBTEfj1fxDSvsDxtQS4X2XCoxTOTwbHqgdSiuYQ/JOEYYbV10@lists.infradead.org
X-Gm-Message-State: APuU4Z9Pb+rb5nwPqArDtwpyNKSJpdEL1BGBmfBExcnXq/nnDrm7oiXm
	Q64HgGUdUFH0Fw/hh8z6epofIb+CzkozVh7oxaXeUt5bzvwOWURDjDyh
X-Gm-Gg: AYBFou3t/dJWtHOG6hWAylgmZ3zPM/WORj50kH/iFT4bY2d0OR8sUFfOTTvAXVDlmXR
	UnZrlHUnVcoZ+DsVMldcnZp7YFkuSwS19RV389isbsceGJqUPUqIMV3u9tl9OS9tilLltBBHEDL
	VcAdm0NcdRKRk3fvItMYialsIoeaySM3uCUZZHzkwXHBdlR43svNqnv223pI4Fn9rqtTXzo+FWB
	I/hK76H1ZUXPRZB9GGTdVUJUnGJNR+1K3hD89blQUoWtPbUP43Xh0siP+wqwt5Ob3B+U1yJm0kT
	XRAX6MbnV0Uz+hDvC8ARlcUoXpgp9p/7P32GUIAC9dewQdHo3QrU+i5EhBIs9kE0zDDiFIDLF69
	xiemwJq4w4ehNiIpWYGQ8/fYXkjWSJN8mQby6TbHYzbx4xqlcQUKj9BIsczFLVX4+JmoRxzZCcX
	P1dKe6RRPBdYSEqDaWOEAuuBOo3UINw2O+BrOX3CYEiuFxYXFUMt/lo9AZe0Jk0wDp80S5LY/ss
	wyMxt5NTjtWZc/wE4umka2jkvGFCbmg90ciSTpZiOskacLy+v/LNzQP+YuKAD+0L8Z2/YBu89lp
	+Sv/I091l1nOmalUcuCvB5ikseXppa9NsXNhVBRSA14l++vbpS88zSvehayMMSpTmAKRUYDVXQ/
	1wHIZ57BwtwzvZOTSxY9Kacoab7+ShkzlF/q7r/HQ0j1aUqlwtN6kZPKGnPBC+uLvfgDLpSQQr4
	wQvA==
X-Received: by 2002:ac8:5a95:0:b0:55d:535f:fb26 with SMTP id d75a77b69052e-55d5a569337mr82885291cf.40.1795078535259;
        Thu, 19 Nov 2026 00:55:35 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:34 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 12/22] ARM: dts: BCM5301X: EA6500 v2: specify switch
Date: Thu, 19 Nov 2026 00:54:42 -0800
Message-ID: <20261119085452.75708-13-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005536_495759_3ABD808D 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add labels to clarify which port is what.

Also set the WAN MAC address from nvram, which is offset by 1.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
index d9e4f84058e3..8b3074684e78 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6500-v2.dts
@@ -61,3 +61,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1


