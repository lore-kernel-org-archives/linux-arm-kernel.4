Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BF2606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tgch4kdE;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ej1sZp/c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TSdQ5TOQ0yFmH1YFXVI+vRhBNVbXW0tI8IkIMvJt8n8=; b=Tgch4kdEr9kr4a8p9Km/TrcE1T
	YOhYkVqe/29mNNVJ6fIZ/PRRbd5dN3YrDhTfmrgdLtpFbl0VjflyY8FY++BpCZVg+akOqWO+1Yysx
	yL2u/Bh4DEoFwjAgl8nB+LHOhSWM5y3afj8pvyzRuJsLGSQiu02WD86bE2q3+n4TaFD8PekXGFuYF
	ppPG5YUy0IK7SCu7I5ibDQL8+WIsQ+hJWMYOVuRGmmgD6ljN9jYPgA4yRuV8Xu4YuxNxwngJ4GuUw
	7fKPX5RGRydxSN3jRuQy2mR97G3hFOla3IkdQ19PRNKEi55xU7znF9fxMKQGICPubnl9eEw8pp0pB
	XfDntuHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVshU-00000006wed-3zak;
	Tue, 24 Nov 2026 15:44:56 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVshP-00000006wcO-1E3g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:44:53 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-385d8a00598so6809827eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 07:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535090; x=1796139890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TSdQ5TOQ0yFmH1YFXVI+vRhBNVbXW0tI8IkIMvJt8n8=;
        b=Ej1sZp/cSayQT972fllSIJwkKzM+TI9gugJhu9+0R2SzZNNQ7JMBS/wQJ2JruRSAdI
         utW/JFgSDO+sKEquBb4R8i0wlsC8GWmj0FjeQ/6Fva1MOGhpzDAdmK4rxOgaykWFG0Sm
         IC9EFjE3piWBQb4aNO0bNfsnpMlBox+HL0zD5o0oWe2Xpz8OAueEaf89/w6OFamFgdGu
         PqhFa3jMOuNzwyvL/aXcCDCtrAWF0KQXw/Ei5I0I9ecGXUm/XcJrW9fnyv0XT3wU3d9s
         jH1fTi88cPBok+anzXlEWsJaBPqeQ1RhiEOUc77YgMXMlDhdjKVFrgndBiXXio87VY7w
         95vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535090; x=1796139890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSdQ5TOQ0yFmH1YFXVI+vRhBNVbXW0tI8IkIMvJt8n8=;
        b=HBM/H31MmDDGJYE6upvb7vcgdnu3kfTcqmWW+cHYZs8jVlqn6xROWe2yrQQQj3LVzR
         rn5PUT9MxHg3oJ1Eh2ugykLKLAxBzXdUBxPeiYULGRhuhcosZKMOfF3n05KrhVobof6K
         as3JnSjmffUSjVIHuMI7xTFeSKpsokulQx+JdZJeHZCzp0+WyFU6A8bJS3K0sWPDBqJW
         C6rRtSZtMLvp+yIMPO67Mgx8a1iYma0SMNaKh2TyiaR4h7c9cQinuKmNpFd+0tfXMPdP
         CzohTulP5Ibuj8Z8S7CmH/iQ3bEncWfkC0nJKeSAEgTnGqJE+FBkM7343V3wiN34thus
         itXQ==
X-Forwarded-Encrypted: i=1; AL+hErF5Ji6SU//udEcpCKgl8tNuxcM0Aj0bcD9ytYW/3jyex3WSnAHSYUb7G9JdtxIkx7GnGi8A6PRybIa6TbnMFqYw@lists.infradead.org
X-Gm-Message-State: APuU4Z9ARwUD167BV+ufLBSNIlDYmqBkKujft+eQbmhAii2MCHR+6f0U
	uACD/KN2ddJ/gp1q/OiAKdGw3ZSF/OpQnnwmeODilsbRnpBLmYQeyRkW
X-Gm-Gg: AZFdTZfhhaWf3ydIgA1wexnEG4dnJPnKcxeks2+KAuQWDhzU6cRC/B7j0cCDo8n5/qs
	84+DzFlqjpB/BszkoO73U8L3R+3TYA1VWhYcDWENpz9mPKoC8TCSiPpBR0Fy52iFvVhqeE1zw8g
	a27mr5XUZUc5RmvGfK+dFkfYohj56YtefaNX7wYJDKtB16FSrR1jE0jhAp7FvP09MV68cfaat2B
	pC9CIgORqZsDYkD5deC96JDSUwJ9fV/m3o6oaOSVMNQGW4+WWJMu3KdO9MtmVe5CdHitz4MdN7N
	QQLZ8+1o5jYCtbgD0+fexG8vGyYIFrojfmq0CBMl7TT1CV7ITGB2/XdiqkYBWGE1sSri0lbax70
	ttfVucDFzrQ3XR7THkJJMR6LPVGEk5OBQoLFbLXnbp0aqyIP+04kcWUphJWgJPqzUrurIyxTdg3
	afr3d8PBFfhUlvdchkedURved84S2UOVddy5fFHEzf1V+a5GZA8GGCXDo8RLkqUS0xj1d7otJDf
	dF57MyP9Ttj2QfLL9SdEC3JF3RgzCcARcFQl6W4jOGIbuhO0AOP/Vs1rd4cyALD7zdgwfjrzg5E
	rE0hON0EjPIAwNvk9J/qTgme/2E7rYWJafL/ZdnKJQ==
X-Received: by 2002:a05:7022:f513:b0:1b3:b53e:b4cd with SMTP id a92af1059eb24-1b5568a951cmr14140772c88.21.1795535089896;
        Tue, 24 Nov 2026 07:44:49 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm58746964c88.9.2026.11.24.07.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:44:49 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v3 0/2] arm64: errata: Fix two Kconfig column entries
Date: Tue, 24 Nov 2026 15:44:44 +0000
Message-ID: <20261124154446.1094507-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_074451_333482_78CD0CF7 
X-CRM114-Status: GOOD (  12.33  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two rows in the arm64 silicon-errata table have a wrong Kconfig column:
one names a symbol that does not exist at all, the other misspells an
existing one.  Both changes are Documentation-only.

The text was written with the help of an LLM assistant (Hermes Agent);
I reviewed it and am responsible for it.

v3: the commit messages are shorter, as Zenghui Yu asked; the diff is
the same as in v2.  Zenghui's Reviewed-by is added.

v2: the change is the same as in v1; only the index and hunk line numbers
moved with the rebase.  One changelog sentence is replaced in each patch:
in 1/2 v1 called the table row the tree's only record of the erratum, but
irq-gic-v3.c records it in gic_quirks[]; in 2/2 the sentence about the
symbol is reworded to name arch/arm64/Kconfig.
https://lore.kernel.org/all/20261121083950.1957044-1-takano32@gmail.com/

v1 was posted on 6 November 2026; please ignore the duplicate submission
that went out the same night with other subjects on 1/2 and 2/2
(20261106235616.1533003).
https://lore.kernel.org/all/20261106234541.1474324-1-takano32@gmail.com/

TAKANO Mitsuhiro (2):
  arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
  arm64: errata: Fix Falkor E1041 Kconfig name

 Documentation/arch/arm64/silicon-errata.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.53.0


