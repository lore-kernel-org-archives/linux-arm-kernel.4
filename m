Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651FB606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 23:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZMaImXPe;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Um6CcoPJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c7lMECP0GDvQ3SIOc0RLblQjT+LWxuUNwC8Ag/lEWPw=; b=ZMaImXPekJf48p
	JYnCfaw6zxBX65f+sQkxfFyIvEGZa2SRkWSqudORUizBUc41YX93ZH0aB3tVBX/P4c0vOqLnWgykU
	/wUe0qxWOGFrgj3+M7TqabNXC2EsWOPV26yeP/6PqtHQAuTF3dvtu9yaY1caRKW6d2pys+Kv8mYuC
	4WN72elXC+/jsrFSj1p5dh/CnEwhPq/vVAgKiHm9QqSulttvvBtBwkjYXk3hbD09mKIuEqPnA/1mq
	CWCDL55iiKjcoh4yhUwDF4C9KaPgeLE77taksbb/oMUAXU7ibvwniVFi/yUsWdozgVwTp9M10KbU9
	AE/ZucVvI77VFHdZKm/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTd3-0000000DsD5-2syb;
	Fri, 06 Nov 2026 23:45:53 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTcz-0000000DsBT-0fpE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 23:45:50 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so673703a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 15:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794008748; x=1794613548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7lMECP0GDvQ3SIOc0RLblQjT+LWxuUNwC8Ag/lEWPw=;
        b=Um6CcoPJ1iktaBvzLv9BuWa5ydv/SFgwDVgA8t3KReeE0vzudDLW/pU5AvQUU3Vwoj
         ZkQ9g6wFhJpZC+9HK2jKin50HbIHsxxjA+uredMqbfhn1Ku+k5yFFdjM/+fvlNwBSsnM
         sEP5POhQpdWlxHWT4ku2H/5/bfhht0+Nao2Ww/jZ39e9GgwRpe7kM9VaOAVVkOKEpzl8
         gonsCBATstRtLkkuwC0I7Q8JJlMYfwL7xUwcyeBCnJ65DauRqEAaTaouxStbAsYjo2d6
         vpYsOYIlwKbq8680krVTyjptA3guTM2mfH513lQExjAV1xqj9LuaRfdZQiGL7lZJuCaB
         Hx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008748; x=1794613548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c7lMECP0GDvQ3SIOc0RLblQjT+LWxuUNwC8Ag/lEWPw=;
        b=QH2PYes1YA1sVkpggRqun/P/KI+h8As1waNVYdZEYx+1NQqExxvNoV6NT/tJh961LZ
         gJKo9YFqaTfxfwz2kDxzjp2A81wmJUgqkLpOopjcfFoaNO9ze6BMfgR/PHCwWFnMukZC
         kbwFL43Q64LdDv0QjiMIX4VUSDGWJWduUE/nvmB1Vcavl6Ipo1dSRph4UCA8d3mq0/07
         cybXoa2LdQRo1ljBvW8IXCiQPIRtJjJV3a2QmoI7vdCtGbjjizjcf6SzOT6VwTkudo/7
         Fz0Fx0g3QH75f4+JABk3t+Wj8v6nJnr9G7bkzDS1Kh0o8rjy+DHCJDvUvOK40r9RVFlJ
         3pAA==
X-Forwarded-Encrypted: i=1; AL+hErHz6fIMajCJenJqrqrQadY9N9BEnFpHZ75GYjtZtuwLTn/YiIA+LcAzE7aAbK90mtn0F3/+SKUcpJ1TdArKyWW2@lists.infradead.org
X-Gm-Message-State: APuU4Z8nt//wZiydqRjEnTA+/a7oGSRKcLM+ZKnOYKkIoGgiq1yUOjkp
	QEt08ENII/U498K9qBMByUYYCD1rS1BQem9OWPK/W1fjKKVi9OME8itfyKz5Lg==
X-Gm-Gg: AYBFou0u1+rp1V9PlPcs8x0+J/tIgyh0IX+gFRIaDq/g7TRRzMXWVItd5cx3FLXrrtt
	ItwW8R8TNXmUZDgitJeJjm7/WjP0kd3OljMlUxyJ3ZNscHebivqgdwE1Ekr623U/ycFwKvAFQuI
	0UzLSlyG0tA06gO1Qqj4lBvbo12x2wP+4J5QyfFjMFUvWqQhZoDupWdTSa6Dm84TLAjozTtW7s2
	6sWjFPigOEaOTb56Gus9Gn0PRG36vdpLuctFBCw61uLnkX/X6hdDmAPO8/bHdq3aUMRL1Dg1431
	VI/6vcM28QyjuLFAI3jQyE+a0POIt9c/W/vLAs007pbJle0q5qhqJu4zp7dA3QxZVQ5FtaW09TT
	ART0zXDOXozckstK1dyHa+oWiUKku8XiWWg/BnAd49eNl9uuzAAzUY7vgNZgZYu7mAUWGPEtvT4
	8ESUm2zKn7brhM6AeYdxxJq+LNOoj4FtKd5wkKLCLc4qiym3LXkVRhtLuoySwFnMCVyTnupb45n
	ZsWmrI4FjCMYILAirek0sK2yZUNVpizcCJiSbfomMhUkBhd55ug2L+fWzw46aMslIohpyaL3BqY
	EuUtjMO1dXNPV0qTlhNc
X-Received: by 2002:a17:90a:f945:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b0db6d7d8fmr3319728a91.18.1794008748133;
        Fri, 06 Nov 2026 15:45:48 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058d3310sm715972a91.15.2026.11.06.15.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:45:47 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 1/2] arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
Date: Fri,  6 Nov 2026 23:45:40 +0000
Message-ID: <20261106234541.1474324-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106234541.1474324-1-takano32@gmail.com>
References: <20261106234541.1474324-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_154549_212780_86F586FC 
X-CRM114-Status: GOOD (  13.65  )
X-Spam-Score: -1.9 (-)
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

The GIC-700 #2941627 entry in the arm64 silicon-errata table names
ARM64_ERRATUM_2941627 in its Kconfig column, but no Kconfig file defines
that symbol and no code refers to it.

The workaround has no Kconfig option: drivers/irqchip/irq-gic-v3.c
passes the GICD_IIDR value to gic_enable_quirks(), which compares it
against gic_quirks[]; the matching quirk,
gic_enable_quirk_arm64_2941627(), enables a static branch.  The table
already records GIC-driver workarounds that have no Kconfig symbol as
"N/A", for example the NVIDIA T241-FABRIC-4 row, whose workaround is
likewise in the GIC driver.

Set the Kconfig column to "N/A" for this row.  Leave the row in place: it
is the tree's only record of this erratum.

No functional change.  The change and this changelog were written with
the help of an LLM assistant (Hermes Agent); I reviewed both and am
responsible for them.

Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afe109afe692..afea5e57ab95 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -279,7 +279,7 @@ stable kernels.
 | ARM            | MMU S3          | #3995052,       | N/A                         |
 |                |                 | #3673557        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
+| ARM            | GIC-700         | #2941627        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0


