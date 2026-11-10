Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15C86078840
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3QMd5QMw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dgzpGUXW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PNvMG0LMoLVP/WGTQaZZL/2qupg9DLTHm2fR/RogwOU=; b=3QMd5QMwztwsiB
	mo70RAIKBXjFDcZmuHJwUmnpEgTXqTiwYes0/BRVWbVgTLXZmeC8Aoo4ZMG1Y7UZc2HkWv4C067tK
	XCByG1D3TCMqChvSXmc4gI158UBWA2WUmlf6TnATKPSlbPeHLWGV0y/smZ4giO29Zn+mkWUk2R1yT
	nOCFEj5Rg5yYD8bmibcYUOYCXjKnq41mo+XKUjGUBVJIB8uNlnnPv7TCnFtBDvZTqYajB+6kceplc
	Ulw2a3hROeoiSdouSN9diW4NBWeJzsyjX4TNuXS/W+TWcQqfrLz7YNeGnp4Srdam4kfO7MM6FvXE3
	tmV3f5mg+MzlVNHelIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiCQ-00000003HCS-3AxW;
	Tue, 10 Nov 2026 09:31:30 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiCN-00000003HAF-08qZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:31:28 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so830031a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794303086; x=1794907886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PNvMG0LMoLVP/WGTQaZZL/2qupg9DLTHm2fR/RogwOU=;
        b=dgzpGUXWT5OcxbAlNLh1HnWSv/W/ME8jVJk1Yz3cy8xXQ81Rtiiu+skVTYbfrHz616
         RmE9QIKpGlyk4PDSsUp2TjXxe37j6QVEjlOgpdW7azDvzSpSNY6rQBHXheyoSBTI+sVZ
         NARxAkRUGd4YMPreVlXmpwxx1n20Up+S/0DKIRXOy4FHRLo/RsOk+TIr9IAVhWn/w3xD
         VmOvW3mYmJndNWKT9TV5PbITp7HgPX1MHO9e1WuF85CmXFEEbHq/lRIGKAerSNAJt8zC
         6S/a7+BlmwKaJ84MIlisuCBvjncjgoPpu154KXU3Kq8YFWWl5B4T09HXGOeE0/VnAior
         AquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303086; x=1794907886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PNvMG0LMoLVP/WGTQaZZL/2qupg9DLTHm2fR/RogwOU=;
        b=lGAafeQ7+FWRt4QLbezRygooPswcYP7/Rf71ZPme+6KuY5+a5vpI6z3PefznG07Vhp
         3Oi0jfdpNxZOPUYBecg2PZPZ3ktQMotb8784JHh/FR2HdTl32mBUTy6GgN7BjqEbxv92
         tC4Aqw6EwybFyiuelDKLSSJRvuGNuL8r7/4hs61QcrEit5NfOcVGEDKTUasBC+DzwNzV
         tichtgEKk9KgimjloXkJGu+qs2TFcL1Tc9TX8T8MOg36ZA5GQaaU4Nn/YPQBHyR7oGUW
         T5MPzb3bHZMZ+uV+yon2/5d3ZtRvpM5O75DtlV/i3YUHQ0c3GwtNVtyAH2OtFMBSgVr3
         XMXQ==
X-Forwarded-Encrypted: i=1; AL+hErF9Se0h0yx2n06G8uQQ5+UIX2sGq7z9K3sE0eUioBfPlb8ffzYoG2yzKWTLkN9N1pVQGwWa72DTx+2BbhzDOcTG@lists.infradead.org
X-Gm-Message-State: APuU4Z8Zg0QYEHzBjqMZZIlYG5bBCC+nW3CIdxE4ArKtWet4kYvpfZQc
	CHOqUaZcbXQ8ujdKDNbTfMDrWUE7+aj4HNY6v/sIedDsbicRne/4rTNn
X-Gm-Gg: AYBFou3mHvDg7GFBUAnJmApC2GQAlWTFJc2cU2/q3K4Grg7viTedmIG4+iXN1xUkV+E
	YuEZ+qPgvZiFH6afNEVGYbdF6Sm8H5BhfznnxYP4cN6JNAChZ5HoXuNX0NdjaQbDNrq+cF4ktk0
	bQgw390QodTPFVm8I5Qc6TlyGUa3zF4IYeEpN4mLvKdKzBt7dic3ApuH5/TMpjyuuuf0DebMYkK
	EMgtPlxnc3+MbxLaw+K1z5uWklU/S0SC0yZI+gTPwsJBEysdmbvO2UQIDmPPKEfXK+/AobZuL5E
	ivt8+wYAIG1crt6TWpNSqN7rkRrVlhXbZnEGw4GGiRmCealRDb9d3Sj+26fTOREiWcFJWEOUL2T
	hJUVzF1dFcLylFBg6wvSXcmcF6Xl/YCHJiAMIe8RYqZD0l5sWLecYZPGFw75rrTOu6kkfHH+rQj
	u03pu7Xr2pksynb6mMshy4YhKto5rFfkbU3XjF+3pJGOeqrESGDOk6B8vLdwJ7rn1lLHvF8bv1j
	/AmKqRO3jiyWYSCUMKX9p27psro2p6yT4evpHSGIPF9f6RXZEaam6L7cX6DFXFu7zJ19JCbBuKh
	fcaqkxRyceT0DglhzQrHEJpJ/Aaiqpet4EZ/cc8CYP30p0yceZrY+wcAgeCo4YXLDBID26dipWO
	x7YNlfr7jBg==
X-Received: by 2002:a17:90b:1dcd:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3b166d31305mr2199901a91.54.1794303085812;
        Tue, 10 Nov 2026 01:31:25 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16913b050sm1115979a91.4.2026.11.10.01.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:31:25 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: andrew@lunn.ch,
	robh@kernel.org
Cc: gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	klightspeed@killerwolves.net,
	jason@lakedaemon.net,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3 2/2] ARM: dts: kirkwood: Remove duplicate DS212 compatible
Date: Tue, 10 Nov 2026 03:31:20 -0600
Message-ID: <20261110093120.179318-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110093120.179318-1-artem122novak@gmail.com>
References: <20261110093120.179318-1-artem122novak@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_013127_072529_5F603AE1 
X-CRM114-Status: GOOD (  11.86  )
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

The Synology DS212 Device Tree lists "synology,ds212pv10"
twice in its compatible property.

Remove the duplicate so that the compatible sequence
contains only unique identifiers.

The compatible ordering is otherwise unchanged.

Fixes: 2d0a7addbd10 ("ARM: Kirkwood: Add support for many Synology NAS devices")
Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/marvell/kirkwood-ds212.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
index 416bab50d170..8b5af51225c9 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
@@ -14,7 +14,7 @@
 / {
 	model = "Synology DS212, DS212p v10, v20, DS213air v10, DS213 v10";
 	compatible = "synology,ds212", "synology,ds212pv10",
-		     "synology,ds212pv10", "synology,ds212pv20",
+		     "synology,ds212pv20",
 		     "synology,ds213airv10", "synology,ds213v10",
 		     "marvell,kirkwood";
 
-- 
2.56.0


