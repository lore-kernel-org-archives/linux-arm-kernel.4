Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0513C60A262C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eCyaX/c0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=leKDHIqh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NP1lHlx0lcLdJ1q9T1+9Abt/eib7JtkqEJFgdNZHVLQ=; b=eCyaX/c0C9hRU0
	rzDRsL8gW083lZEZQ2imM49p81Da/VNHEW2elKffzSZbyXDF4eil0pFg4Z+hZg7CLryEH1zoa/8Hi
	dCFKFCeMxp4VnJr7jFZaG+g6AC3tMNHMLxPXRblqOeQVsVQz31vbAQMDG5JfzduiebTtIRiC2t5Kd
	3f4nSF1EpCu7XHlMRSnYZw5vReft6JUo05n8h9Ze7dBWU0QlfUFpOpJOZKDuR4fu7dSUZ2tMe78kC
	cfsbbbW/72HAznmH6cAySHgJVUezs2Lb4yiyuiMm39K1v68mNQL/4rmKGWFX/4frkpw4lhD91avlI
	J5dQ9FKJdbDYsUBkpa0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnsi-00000004PZD-3UYd;
	Tue, 10 Nov 2026 15:35:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnsc-00000004PSr-2eYi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:35:28 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so18629855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794324924; x=1794929724; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NP1lHlx0lcLdJ1q9T1+9Abt/eib7JtkqEJFgdNZHVLQ=;
        b=leKDHIqhmysbeEZgC8Axjw9qBhl8bwCfOArG36KIAjp9BToxChD5UGSLy1R9p133A9
         692a2d9t2ZJ1UpTftoxMshbBdkC/s/eW9VnZMdojlx7okhHzKSDyXYgZhFYSONEDjCHe
         cjd9VLJeerhuYxSuu+zL9+dN7uGkRczznL27aSWiii34BOP9GZrpQfp1i5b1/UG0aSWA
         zm38OTHDEXjXkNvgav6fZM+hTMh5fWmbHRL6U6r+26AXZXicxTVwoPeh1xz7IVqSZCl8
         8LDejLvw67Kg0J5CFNyXgO8st+a7mLB1Yv5v6Nm5JQUEml5nvyE81S+X3h/KYRgut2NO
         KHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324924; x=1794929724;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NP1lHlx0lcLdJ1q9T1+9Abt/eib7JtkqEJFgdNZHVLQ=;
        b=QydkZtggH/DVIaZfRanAD9ZEZpROl/IYQ1fkdJDfh9/42/PJPU56lH2kJ+Hw3Sjuk4
         TT2CzpGzLnXVcGW9ImCFlN9uue0BmdDwFNUQ3TONRn5JqeNj5mQL0c97v12FUqnlXTkb
         yJhAHTR9Aeq53zVuLIpbg1cqniecPwwANdB6BMd08EK2wS07gF54ftJEp0+dqydXmtgI
         u+oRG5j33T6woi72o3kUfaxYPCw8F9vogWXvvv01cM1dtkv3cc7mE3J+qNrSexzwfFF0
         ObdfY5xUQli/uZd7hfq/1cpapjTvNfpyESH39msksvsJCtIP44OTNo39SmM7Mo7Aawqf
         9zgA==
X-Gm-Message-State: APuU4Z8CZbYQFoG3J56gE+KchBnua9zT11ig9nedhk8wSPaLy6FgbV0r
	T67spcoOYd4Nm4k8o78yC2UMifcJDm2pDgGWY+DZ6r5+NGW5MiYO2JCUGnTZvSfRUYQ=
X-Gm-Gg: AYBFou0k2RTv0xYvnjPKNDN+C6pJDgLtV9jtBubtsi0MSTNpglqqJT/XtfQq96D5BWv
	wOdmLRuE9e/Rw+UJuXkuZFeY0LCE3GDZ93GbG14O/f1UMWQgFgDyX9+2XlBIrM3e+9uxTvOQQ/U
	oK5o2q0oUdOTJ8IcUY/i2gnQLDW+JDbbpkgIF8GzH17VHV5lB9T2JMGRxxRui13YW/WuiRcVuKb
	jGHkhxhIquua88yBqNAlKeLOuk0VF7RwHGNdSXmnrjAAUJhaFkZifzt0bW3VtaRVEMI6b0oM/QE
	1vT44wVxJ4ouYgbRoDg+tSpTEYghss43phGx5w4IDlS+xzQw8hw52iub16pwe2QbvKDcx7XobuZ
	IXE+Gc/+IADaw/JMJXEXa0qN6/9WYhUVH/whzyoCRZidDWz57eyfgk3O3JLnVlIXypkryUop0/P
	lwehyOrgC4XczTG70hBdZ5e6IQ9sn3fZXR5b/nuptVC3uJPdgVIu3UwBLt7YDeompl17tTGfeXd
	NcpzTygd9/O+na+a8MREn2KxHCOXrZFtF5IcWb2fDpnaXg91M7Gqp9KuQhNdAXnkcuO8WXeKqUt
	orOuRa+sOn8tSGwMm0SBfpTfFmGVVfTTzGD79NqmbQkroGC62sPgR1cg
X-Received: by 2002:a05:600c:1384:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4ba0234ed82mr50387935e9.28.1794324924323;
        Tue, 10 Nov 2026 07:35:24 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2cb2sm67511805e9.3.2026.11.10.07.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:35:23 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org
Subject: Re: [PATCH v2 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE ZXHN H3600
Date: Tue, 10 Nov 2026 16:35:22 +0100
Message-Id: <20261110153522.1620088-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <taToYWqTRsyGXzOXNcd5Qw@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261106190828.3823287-1-isasmendi.agus@gmail.com> <taToYWqTRsyGXzOXNcd5Qw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073526_700388_73ED0900 
X-CRM114-Status: GOOD (  19.22  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stefan,

On Sun, 8 Nov 2026, Stefan Dösinger wrote:
> However, Arnd Bergmann didn't like the hack and it looks like we don't
> understand what exactly is going on, so they agreed to postpone this
> particular issue for now (see follow-up replies in the linked thread). If you
> have further ideas what ZTE got wrong in the hardware and what kind of
> workaround they use that would be helpful

Thanks, I had missed that thread.  The RFC I mentioned was the same
lock, so I will not send it.  Here is what I know so far, from my H3600
on Navid's v2.

What ZTE does (from their 4.1.25 kernel binary): l2x0_lock is taken
around every line write of the L2C range operations and around the
Cache Sync, and around every register read of their mt7915 driver
(through an exported fixed_pci_read_u32()).  A later module only makes
the lock finer: the range ops drop it every 2 KiB, and a pending PCIe
read makes them drop it early.  I found no chicken bit: their L2C
setup matches ours and their PCIe init has no such setting.

What goes wrong: a PCIe read on one CPU deadlocks against an L2C-310
line operation by PA or a Cache Sync on the other.  The TRM (DDI
0246H, 3.3.10) says those operations stall the L2C slave ports until
they complete, and here the PCIe read apparently cannot complete
meanwhile.  3 boots x 8 minutes of WiFi traffic each:

  no workaround                              hang 3/3
  maxcpus=1                                  ok 3/3
  arm,outer-sync-disable                     hang 3/3
  lock around the Cache Sync only            hang 3/3
  lock around the range ops only             hang 3/3
  lock on the L2C side only, reads unlocked  hang 3/3
  lock on both sides (as ZTE)                ok 3/3
  dma-coherent                               firmware load fails

So PCIe DMA is not coherent and the maintenance has to stay.

A possible way forward: Arnd's fallback of SMP with the L2 off works,
no hang in 3 boots x 8 minutes (75 transfers).  It cannot be done from
the DT today, because l2x0_of_init() ignores status = "disabled"; I
had to change the compatible for the test.  So I would suggest:

- a small patch so that l2x0_of_init() honours the status property
  (no in-tree PL310 node is disabled, so nothing else changes);
- Navid's DT disables the L2C, so mainline is stable with WiFi;
- the lock stays downstream in OpenWrt until there is a better fix.

I haven't measured the cost of the L2 off properly yet; I can do that
if this direction sounds reasonable.

Cheers,
Agustin

