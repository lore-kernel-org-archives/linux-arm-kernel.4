Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16728606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cgx5ECot;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kpRCZ5PW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TsUpyU23STfI7Ygctt4GB9RTSHTZ6HCWLhGsw93EbNE=; b=Cgx5ECotq9Pv/i
	ld6qZIdL0MDhWl0Hoe5Y5fi5FEx+DS2d1U+rxoXLb50+iVuVIZ7g6ZHCDcelISzjPTXZYjjgrfxGB
	g9NVPgd6V5UhdR+WVC7tLaHFRKYHRPRcyUCbBLuTeQzw3WcfLXNdMRuqGHUZt/U2dmgALrRMKxqg5
	77ew/8ku7S10QqhWBJPNCToWMaA9Bp7vFmasqSHN3wY7kwdlqkBKWyU/bZhTPuZqmSC/9tOTX7rCr
	gmAx1tLv0Rp9EhBg9IoDlO7DSZr3IxXpe/yj90KFuf24Rnx9p7gFYIYdHnQZOljdIS/fY1tyrUINX
	+ygfkID2/ZhGmoXdgXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYXW-00000007m2b-2Iue;
	Wed, 18 Nov 2026 05:49:02 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYX0-00000007lfj-2frH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:31 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-380b40319bdso1048110eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980910; x=1795585710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsUpyU23STfI7Ygctt4GB9RTSHTZ6HCWLhGsw93EbNE=;
        b=kpRCZ5PWROoXRh0ylVQ7McNbBk0hhhHNuohLWlUaxa6raC1qxdmz5tJ92xhyKwBbSI
         4amq8UMXq/EhjRbcu6doVqcZ/IwLe2sqBRvl7eu1wDiR7h+vbbmHHqpEmVIafDq5PoJB
         jVAEKW7Q7r+kTbaHPgTlv2zpttQvF3v24GkFqSgoHHauPYPCpWD4WFp7W97WX9bejOC9
         KLWTzR0XqEBuEgoy3VmJ0yHq1JDxHEvhAhtK4W+LgVAoXw6iR+4kjsR/1OkLJB5oRk+x
         XG69DCCcoXaF3/XcKj2qkpBQPrxy/zIDFv4wU7YDcbhAUYyNFX78CwNXz/9u8Y4I1qs2
         97kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980910; x=1795585710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TsUpyU23STfI7Ygctt4GB9RTSHTZ6HCWLhGsw93EbNE=;
        b=M303dEcHASdjwZ+TLQ3ykP69c2pcC4YyRqN8D8EOqrUQwrxfCY8g2JgWAOt42MRfKL
         +h2WzZRYRiDNwN4ki9mbkGc5aAmb6ZISVOqBHlTIAdN9kzonI5FDWtipV2FObVpGoLFH
         FLMK6rVb7O1kk3G96xMQVgU/sSfp6VGRO20/ncxzbJTfEOm0iHBdID1FYIRigUwEL3H7
         FQE2B4G10hacTE3RRR1E4WB0I5vXS+fjzuCy+OAZRfBcyj7aC+KceAsgRLgZo2yQr/vR
         Dv5JHML+pEcCJfgHwgrX0HcB2t8TTFmgiWMJK2csX7ZuDoOm5JKMErfsOAmL2DlX7OUl
         vCXA==
X-Forwarded-Encrypted: i=1; AL+hErGQfYirCS0+blTTSr73/79C9ZHz+41fsVGai6+nPU0+QuZp/KAzc8e/OzR7HludkIM8O4Ag5w3mX4sgexAb1bt+@lists.infradead.org
X-Gm-Message-State: APuU4Z9Us1cn5o9KcegQCeEsYs5fM3ONBttElDjZ+Z/8rRXAHScmEQeQ
	L5rDoNSKJ9AzKCxZ4gbS/wJalQRCuX41QHgGrcQq54vEwqj/9sZTYZn+
X-Gm-Gg: AZFdTZfcgYRspOZku1Bnd4zk73KYt8AlScvga9XpcWZ5gUCp5uS5aX59kNxq0I5kSiK
	uUVaqn0IogTDmtBjUvWATrQ1EG71RV4+6g/imdPKeo9cROC1yXKxuMoRtn3xbEONIbio9bNaN3Z
	TKMHJDSVpupH1+z/tUiJVLvs6NTcVz61yUqfj2piVFOr9gHr0vnl0WvMsuWZhPGXaMMKYeuQrno
	O+1QwIcDIlU7TcbjavsCI88M5JxzVaFwURbncs195/ktxBdW7c7FOwFxYpc0sexHIyLMi6I9F3e
	9rBYjW6EXEmNKZHO/8eZLIaIzfY/41DFMhgd61v9c8ezMT5RWdd57FhY5U5fNjS7n/NBAobRM6E
	5cDaM0pfOP/sSEIeBRfRA/TnOwO63aCEiUl2doych4xog5tFmv8Vq8uYFnAv+VS4kaSj+Yf2UqA
	Hpo2bsc28bdemlp5fXcSlbJSP9wDVCf2RatKw6x8iLeQ6Av1gRNaF4/k7oOVBaT/ZaeDJE1EG81
	LQbjP6Fr8vg6a+mUijr17WQ2RZjyKb0EkLEYTpuIwWboEbM+WGdj5cOVW2Rb8YkQFD07hqCWTgN
	Tc1XQFdryojcy1XDZDjJRc8oZONTTlBbLFiBzSuHuB1XUKIBTVcv6Jcmw7uJsKr6scFONoLbO9z
	4CDARlveoRz7tsFunXlodXrd0B/Yl5WuoGnvimLrEKvR1QmdXWgOwsRRQkKgYSDifIT9qpmHSFb
	OZiQ==
X-Received: by 2002:a05:693c:8812:20b0:36a:31b2:8643 with SMTP id 5a478bee46e88-3828162490emr1557800eec.38.1794980909989;
        Tue, 17 Nov 2026 21:48:29 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:29 -0800 (PST)
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
Subject: [PATCH 09/17] ARM: dts: BCM5301X: AC87U: use gmac2
Date: Tue, 17 Nov 2026 21:47:50 -0800
Message-ID: <20261118054758.132233-10-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214830_823988_C4090171 
X-CRM114-Status: GOOD (  12.45  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The nvram MAC address is assigned to gmac0, but switch port 5 (gmac0) is
disabled and port 7 (gmac1) is the CPU port, so the interface that
carries the traffic never gets it.

Use port 8 as the CPU port instead and move the MAC address to gmac2,
which port 8 connects to. Port 8 is the switch's IMP port and gmac2 is
present on all Northstar SoCs, so this matches the other boards in this
series.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
index 2fed02ebb1d7..4114c6eda1ac 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
@@ -71,7 +71,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et1macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -108,10 +108,6 @@ port@5 {
 		};
 
 		port@7 {
-			label = "cpu";
-		};
-
-		port@8 {
 			status = "disabled";
 		};
 	};
-- 
2.56.1


