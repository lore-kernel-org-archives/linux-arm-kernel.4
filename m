Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669D2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3lwEO+Ij;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qC/3I45v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TzTZoWcHEL/gSOs3Vo0+LX5MsR82QU/4aKtI268Jly4=; b=3lwEO+IjlfIpw9BdcRsUOz+s/d
	9JcQT1JHoHM/+XeBosHHFNS9CcxNmx6rTnIxlRqaVYJSwp423uuOZ7jL/7dz+CjJRxqWv2fwifLIA
	legZWLxFH3VCRWFxmfu0ERzvs4Ng1UI/3rawQUSTbrA7rTGmvGYg0v1us+SKkXUIIRh6aswVEPnbK
	O+O7rXNXoKob7n3fZrABwCLVYyXvgNRkCDAc3iKSxXIi0eaF9+muqWI1IqeNi35I+kqbEZRVAKUuU
	eox6Z00CkV9tUHc6w58d3rxT4NDx4zc7Wqz/bLVNpqqPBq37qkNCYThnQZyczFjiWPcnkslfSgStQ
	Un19gk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV36D-00000000sKd-0dpi;
	Sun, 22 Nov 2026 08:39:01 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV36B-00000000sKK-242O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 08:39:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso1767933b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 00:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795336738; x=1795941538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzTZoWcHEL/gSOs3Vo0+LX5MsR82QU/4aKtI268Jly4=;
        b=qC/3I45v48+xryvGjxE0Hdjwwcm4015CHTUMgGmXvG8RsYpW8/BkgKQ22J+jJDvGZe
         SizBUpmTsJq0XvceQCuMbW6YiR3IhkzeprOiGQTPex5Z8QIgdRQ88X6vq7Ac6BQZhxNY
         BJ67uHO+OhA/+vgAiz+cGxKGJo/ylopqc68NMuo+VXpmNEsKU1OA4Koy+WEYNDbimi7j
         86kvYvyl0bGhAMZrpjhBX1AAHbL9+C7FoGOh0GX9Yb0YIN12t3PC11yBl5dAsLJMef09
         dBCS0tiVAD8DlUc3TpicsbR3ZOLyZLROYvuaXLob+3Nxzy7wKxlcdQ9IHnqvcHvHpgK8
         eKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795336738; x=1795941538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzTZoWcHEL/gSOs3Vo0+LX5MsR82QU/4aKtI268Jly4=;
        b=YqoBbJu+vCmCyFwVQfOsjx2Lpi7FxAWpupmRb88mXVTUlms65ndANKgdrAJN/W7Vwt
         9cEuHX1meULXnLtcpvmfbhI81zNpsVpepbr/U9o85cLnWvpJRJjtLND2r7ufCqtY6moE
         PabEXvI9/t4g9+4z8urGDoE44h2tKdsUSHUihnMQKZ7/nPwCnZNKOI96TAE8oHIWvUl4
         /3oFUmfnTVoDEnfmt5Q8zzAAMH8pElhowRX6Xb5eIZzoOg5/YT/6k8yxX6aFrY/phViR
         u+/jPlQFuol2FUo8ARuufgdOKXkk2Npi+B8NzmJxyohDlJvlXcUniw+3HUMRogYu1Ixd
         PmAA==
X-Gm-Message-State: APuU4Z9PrF+E8tqXwkPuqD2UzUS2AiUxrBWRtyl5FiydTMy3lPbbSPPM
	C0FWynbrh1l41O5j1Pug8VxqcXpIFN7yQ+EOHhnSy0eAlszTIo1i1IdLz9FGHfNFeNQ=
X-Gm-Gg: AZFdTZfOLUowEDloZde/IQ9uLzGiKEzujYzluix9ycPUE9AiQ9eIsAnuvj3nraWdHIX
	a/0l7qhllIdky5WVFcyy4MWGaVOkygF86kJAqa4jtlNcd6y6pgvXBlMDaXbFmshe54UKa0pEVNW
	32znL+tV5G+e5jCyVQ8EHYoVq9GhObbOIYYD5UGibD5upFUHtMeRHQK/rtB0HfXSM7Qvztjihvd
	JlwCKvqA9bd6Z78B3YTEur9Z/K3cVumzA+9SPgg/rMkkjWvdSbVwFdF0+zr2N/67aNmimj9tgxB
	emGR09+N0eRcw5Q6Zp0YCFWtFgLQka9kXxLNR2VEnmNffPX0xX5/zjPfzn39XqUzRUa4Nw5UnEE
	fKGMQPmWLA2qcFUabU6lSoFtSkY8ncoTfYqV7KsL48CEm9yeejkcsxJ8MOExDpd120OqzYw83tT
	Bfjz9xuPv5mCrjyGsFPv1tZpv4P0uZh3/Gwyuyuu8phG1nURm4XSewyOZObgWlLldQQuQGkni42
	tu7RHAO9agDxaa/qKgTjUPaa4SBuZuECJOCFGjfT283oD1C9D/fYT6wJ1M6HGd+1TIYaqnz6RD5
	fbEqv9UxMuKYiqhV4W5tKyL30AhYSk2/UVq8V2o02KeI4YNhF3A=
X-Received: by 2002:a05:6a21:6f89:b0:3f1:fdd4:5742 with SMTP id adf61e73a8af0-4014ca44afbmr5515841637.9.1795336738339;
        Sun, 22 Nov 2026 00:38:58 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f11da2sm3549381b3a.55.2026.11.22.00.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:38:57 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] ARM: clarify StrongARM TLB invalidation limitation
Date: Sun, 22 Nov 2026 02:38:54 -0600
Message-ID: <20261122083854.176071-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_003859_556256_9456F885 
X-CRM114-Status: UNSURE (   9.48  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The existing comment says "w/o I TLB entry", which can be
misread as saying that these processors lack an instruction
TLB.

The implementation invalidates the entire I-TLB while
invalidating individual D-TLB entries. Clarify that the
limitation concerns single-entry I-TLB invalidation.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/mm/tlb-v4wb.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/tlb-v4wb.S b/arch/arm/mm/tlb-v4wb.S
index 04e46c359e75..f72961267b08 100644
--- a/arch/arm/mm/tlb-v4wb.S
+++ b/arch/arm/mm/tlb-v4wb.S
@@ -5,7 +5,8 @@
  *  Copyright (C) 1997-2002 Russell King
  *
  *  ARM architecture version 4 TLB handling functions.
- *  These assume a split I/D TLBs w/o I TLB entry, with a write buffer.
+ *  These assume split I/D TLBs without single-entry I-TLB
+ *  invalidation, with a write buffer.
  *
  *  Processors: SA110 SA1100 SA1110
  */
-- 
2.56.1


