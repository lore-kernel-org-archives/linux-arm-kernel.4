Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F01D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yEJla6L3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0At8UCV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U0zckNcofs5NcNAnuCtdYJs+4hx2lPz3JUe/9YdZO5g=; b=yEJla6L3Rhibwv
	4XoC6/FL8EgRXH3t8t3uVKm0oTLKfwhFN+iEgwqZXbA/ZvlRxPSNZNVjQF71sytI7WK4pyBdzon7T
	ONN+ajESkVhlkV/yB9d20QUADwJYTyL3r47LKVfQgUj5MOrP8WO2LOZlE/unliCE/A52bqR4CSSEC
	Ln3njZ7FofO4z05+TjRceLd2pCAkWf+wGdGSUruhYhMs3w7E9esaNqlkLsxwmtglXhQ+tsMB5sSFo
	2+L1PlLrrcCTI2DgDvyqJGpmwxD+Sz0eV49CpDeiD8eBqWs0281N20IKT5JscvE0etbbVk9qm2E6v
	1BO0iS8F8TotjzCDkvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy9r-00000005Sc0-0c5d;
	Wed, 11 Nov 2026 02:33:55 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy9o-00000005Sb0-41UL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:33:54 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-14394530ec6so3565142c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364432; x=1794969232; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U0zckNcofs5NcNAnuCtdYJs+4hx2lPz3JUe/9YdZO5g=;
        b=W0At8UCVmlG1wBJOX93t4HFEuUIvMDEd9lwWxyc+j2sKaxqfO3CLdd6IHXP0pslgOY
         sss71+KgnAyqbtGfQ6PesspwxvulCZABRBlsh30Ltm5v3t5Uar9NLv4PrfFsujrp0Rmm
         WgF2GYXJB0t+HSkRWQapsc1g168jKooODWYk2HFDWe3FOBJix4ikRVBlERZsgWWlV25m
         axCBJOatUc+WQ5+3SdVjGSJYt7ut50QLdw1SRRqJ/MqPOYgXk0Lfk4Hzpc42d4yKVZLa
         eJcPlo6EWVDf0oKl8USKIAKN4lx/n41wv6s0XX0+IVzOuwWp4BfKKbrBgZxCK8NH7+PY
         LL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364432; x=1794969232;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0zckNcofs5NcNAnuCtdYJs+4hx2lPz3JUe/9YdZO5g=;
        b=cjwHaOct/APx7u5T7Bzuqphqj9JjupH/31lL9P6hlFPdcuJuioD0OBk0MsmbxVEEvk
         gfw+Vs99SnjXyX2mwC2Fyibr76IEPpoi9s1Ytpb9pmTraZonP/wQXZUvMmEv8xeJ44pG
         U/3PQeoR/lJ73JmHi0TaIskruA5mj8kI+aJmG2/gWJyMg36LYuaYGU1MUv+odMeilgNo
         QUpGnORkoASjqiHZuplrKDye/+aVrd6H1kH2Wbf3hJl6uLBPRn4St7xWQYmbdWScm9ko
         eTkDTuY57aT1puqyTCnhWQTAhUWnDxknSt1v+YbSj6sA5GQosDb6vyZmDyXkS4Ekqdly
         /B5w==
X-Gm-Message-State: APuU4Z94Y/9xyPWDN4629UBTfMhBeODdWJO+vbJ1u5Onmh2r63M9BrCa
	8SyzcyZ4/ZUfux3O9s2jBCDW3njJJcvvL3YWEP1B1wNCa7Ybp9TmC22H
X-Gm-Gg: AYBFou3Vc1khnxHYSR34UDZ0aVqoeFg1iAvptnPfbjVcekmmyWsABZv+3WZggb9padB
	P+XpqctcvPSojDZTBHtNJpJciP8X7zt5vVJMmLx1YASXXIMPbrCCbFTBnko+CKMNG86szVjbh6v
	RUXhuY9o6WYC6ADHFQXiC9mDv2rxHnWWc8cc4oaEgWLvPsCu8SJagYHDLC8TiI7Nem6Z9bCl5xV
	k5S3pwujH0Bv3KDfdH2MBLfnDHObbIKgziEgM5dUNB62VoG7RTOyIC+iSgcO/iDJ7VN9BZQIfxl
	p0F7Gfw3NXy93I7q95xwO8fNI2hia018qnNXa6/kD4JFlvHAAWmeGHWyPQp6LOxmXOjeVMj54gU
	EGBUvfpPwNpYVhxNKEkRNphL0Nf2X7tBA1rv/8EUI1NufaVuzJFLz98e38oTamaxmvTA9RHgy8t
	eHWCrxh3PM+ut0Q+6828QijN+GbJ798FQc01L6ccFsfNL469gyR3sMWGB4b7CFVxAzAMRTkGxGD
	ue2upTtvkO9S3deZMWIQXW/MVNS2pmkOwoQp4EETmy/T1I6wa6MckwRhUHc9aDUIOAkWlUlyPrj
	EJvohGSvv9QwBKTPHTRDmvPLbw==
X-Received: by 2002:a05:7022:ea8a:b0:160:90a3:ca8c with SMTP id a92af1059eb24-1b3c0334a40mr1074066c88.7.1794364431866;
        Tue, 10 Nov 2026 18:33:51 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm9977000c88.8.2026.11.10.18.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:33:51 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: [PATCH] arm64: perf: Fix the userspace counter example link
Date: Wed, 11 Nov 2026 02:33:49 +0000
Message-ID: <179436442976.1969388.1279174885793827001@gmail.com>
In-Reply-To: <1baeb4ec-4244-42e0-8c53-29df079c80f6@linaro.org>
References: <20261106234551.1474417-1-takano32@gmail.com> <1baeb4ec-4244-42e0-8c53-29df079c80f6@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_183353_005406_AEC3E98C 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

You are right on all three points, and the middle one was worse than a
style choice: I measured it after your message and "perf test -v user"
does not run the cases in mmap-basic.c at all.  It matches the tests
whose name contains "user" and runs those; the mmap interface cases that
file provides are 175.x, so the v1 changelog was wrong about what the
command runs as well.

So v2 does what you suggested instead of pointing somewhere else:
the sentence that sends the reader to another file, and its link target,
are both gone.  The How-to section above already names test-evsel.c as
the example, so the instruction for running an example moves there, next
to the reference it belongs to:

  make -C tools/lib/perf make-tests
  tools/lib/perf/tests-static

I built that pair from a clean tree before writing it down, and the
Makefile target produces both tests-static and tests-shared.

The section on heterogeneous systems keeps its text about the PMU type
number; it just no longer ends with an example pointer that was to a file
which does not exist.


