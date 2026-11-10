Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C621A60774F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=obS8R8F1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NqGikYnE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sBy6UaDPBqe3x++DW9sJ+DLRXeTLdTCpRVDgzEeSkSk=; b=obS8R8F1d/0Qln+p7p+c5QeM6Z
	hFtwmc1k92gP0YSAcPTUk1mDDvHhs9KFCrAZQ//SqoreamtBhN6zSXrVO0IsdikpEGE1zz8I/lxxW
	SD1hbkVUW5yead5X9pfagq1kcWYX8VFVPDoB6GAxfpMYEvd0Q5iZl9gvLPUb0gLeACDhxgrf3sWh0
	oKOnwHwWWRV88pvSmWWLons45j80BJ4fiwW+VhRVTsNkjIQ6tT2Q46yP4MGjD48Re1lASsJD0iLrn
	Uu283I/ZoGs2AzwA3Jfj9M8XUm4r/Dbl3JW3/HOAnUhmakOY3u9F6FdHGXOJoHtcqXgTlKuKX7YRS
	0QxGyGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiCM-00000003HAG-2L5c;
	Tue, 10 Nov 2026 09:31:26 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiCK-00000003H8x-1hTz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:31:25 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1018269a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794303083; x=1794907883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBy6UaDPBqe3x++DW9sJ+DLRXeTLdTCpRVDgzEeSkSk=;
        b=NqGikYnElGBnIQV7Nh/Jt7Awv5A2hW6YOKjESLxHke5lvN3lpiRxQEjLM738Zfx95Y
         tr2sgmLKR8tTfELjEI/k32xd8NVGAnAB9vT1C3qP6+psHALShqwxIhbchelYhc6R7/Ug
         +Q7sRyeyejU0JhC0riC07W5RWOiCuIJXZErqN3QePMJmQugCZgk0iYQhSPsMZYnlxEYV
         3YzWgRqPwjBH+l1i21zzefZvipIBKG+eFTP18PXqJC6+bXwT7Bn2Tw04fDl657dyVpKY
         qGQxOWnDQEq49DVpAev3C5vOxNCpTQMWK2mZGPPKP1JebTrK/9yQ1Qr31modpFvGQaTj
         +yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303083; x=1794907883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBy6UaDPBqe3x++DW9sJ+DLRXeTLdTCpRVDgzEeSkSk=;
        b=Iyx6Efn9H9+c0oNrYkbhTg/6w7Xx4iqPz1QIi+8PWL9d/pubTrSo6aSl2Mkr1s3WBs
         zpLXwqBn37ETsYrWg/DgnWkCsxlcPrFigC0u7xDahYaw0qFiFQfPoKQseZB2/Y83Y8Ux
         r/Ww6XfBl8dz0whZiYoiklQKQ+iai0E0svbOwLKcSHkmJIs/qQVFsqGs9rTJ+Tc6YHP1
         n6w3xmYuykwNuoYAXtu/rUwgSvHDPxxmEH993/yX8MCPpdYmsm0xr3VxQl4Byh+zURQk
         Lst1uvvNLqJNmCYZupEd0cImYWqwGKA5wVCwwBtmxXNpj+a1p2Ft6Ip28WxUSgBRjfXJ
         gwmA==
X-Forwarded-Encrypted: i=1; AL+hErGnEOPncsFeHEv7xk0cxqpNjmIVJhYTxt9cAyWTcJanBhhSdGtWhFPNcTyaAVtav/XCfKMuaUGJQ3MpSTt1Ntae@lists.infradead.org
X-Gm-Message-State: APuU4Z+Yhg192MfbV2UqzcBLbUR2RTbPNdBXFgvNL8a7Mm6d6QnbKbJ5
	Agriv+HxBYgI0xQ5CsFTkeAKV0DNhTEGXO614V8DhN1s9uKbCznhayk5
X-Gm-Gg: AYBFou3m00RN2TYeg5PQ6ByCWfLGXEdRi8zzme54Jivgis9mkMfPlZdOHYpRmkbGzc8
	LIRg2KK5oVjQIqiC9SQ5ZkkzWhh+WpVGTc5UDTNiiDGvhKKQV0VQt1VociGS9sPrryAH5crTeaZ
	N0DUYfLGIEjhPOhvbSYTxciKBvz54Vbfy5AJor+6nNYn2DtikGLInttzhQ1BPsiiATg1htrTRcR
	jRgw59GSobmM6etNoC43d10SwaaghufwXLidX3/zGklpLYmU/N8S3NnM0R4S91UgELbL57mzllx
	5bFIhbZxx8pyGFl/aDeWyiLwhuej54YMv8qcZGoToxw2ZWp9sWKP+T8kUMqxWu+wO8Q9I33nP13
	j7/Dj6WL7HbHiNu9jRvBIH6cWnIdMxKFGLzzQ6ZT+R8J89lo/6eUTU7yYDYj6AAUdc/3Gt74QyI
	6n82Ce2sGZm7bfjDYjSI7V1Z5BVMR31jpwgw/50WHB2EgULtv6tFShQYQi/IztTPN2OL1RAlqr7
	bGPnaeUTdZYNDtrJOAkjEndS9fzxsIm7JEWN/KhfQW2AI6S7KVJkuBqT3IMdZRj4vjY1XaPdF3B
	onghgBSUAQFTOGfXQgyyfrc0TTXq99bMh9waxk55q5kvjPw+sEAy2Mj701KMnFse
X-Received: by 2002:a17:90b:3809:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3b166d329d0mr2096181a91.54.1794303083150;
        Tue, 10 Nov 2026 01:31:23 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16913b050sm1115979a91.4.2026.11.10.01.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:31:22 -0800 (PST)
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
Subject: [PATCH v3 0/2] ARM: kirkwood: Remove duplicate DS212 compatible
Date: Tue, 10 Nov 2026 03:31:18 -0600
Message-ID: <20261110093120.179318-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_013124_442246_C7B2A286 
X-CRM114-Status: GOOD (  10.05  )
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

This series removes the duplicate "synology,ds212pv10" compatible
entry from the Synology DS212 Device Tree and its corresponding
Kirkwood Device Tree binding.

The changes are split into separate patches for the DT binding
and the Device Tree.

Changes in v3:
Added the appropriate Fixes tags.
Split the DT binding and Device Tree changes into separate patches.
Addressed the checkpatch warnings reported during review.

Artem Novak (2):
  dt-bindings: arm: marvell: Remove duplicate DS212 compatible
  ARM: dts: kirkwood: Remove duplicate DS212 compatible

 .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml       | 1 -
 arch/arm/boot/dts/marvell/kirkwood-ds212.dts                    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.56.0


