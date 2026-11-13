Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDD0606DE97
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d4c6r3tH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cy7uPUKS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fM5KcKeiT2dFtKAL44kR4N6b9OYdh4IfZpoD9ReFTN0=; b=d4c6r3tHkFU10w
	AYFZtvVTquuqRRGbqt6xaImvRgpPZ99eNhcHxKRECe+PALAjz5hts1oWsr4gBR6nXOuQxDO+st8SQ
	KA7DULVgsUxUO6wFYkVIV+lJgO3IqJFggtcCKnCASZUtV+mizaaoYqw32P/v/n77eW3OhKWAepP8N
	/Cf3dgkOEB24j6iK4zyhXKfkWgxXUKs2mhyfWy5uq9ZacDnxGqbztDFkS/MIMz0/0oB6f91RiyBwh
	Y23FKmAlmHZI9obS99xTDGHFQeTq+TDEwY2WUTqbloDn6lresH+LJAw+MxTQRaCfIzl9akC97UWsF
	P0GLeRIfrzs797wVjXrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfHl-0000000BL7w-0vhQ;
	Fri, 13 Nov 2026 00:36:57 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfHS-0000000BL2s-2EBu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:36:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a208d93758so4906655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530197; x=1795134997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fM5KcKeiT2dFtKAL44kR4N6b9OYdh4IfZpoD9ReFTN0=;
        b=Cy7uPUKSp7fDrWMfljUfz56EwcnPGYBDD4r0iVv7U1bfRY5bsuyJBYMeGrGXvQhPvJ
         yy5jIlCr5P70u5Ijn/k4sj8e5PSxKID+1XHMkKC/3eh3PSScmR5YFpdDqRMUAi86/sB7
         MHEhCWBUs2i244ztJFZVbGjO/431epMmbKxjaUgfC0H7JXPF6/pyVDipzRifD2jFo2yf
         /dhpkA39tgNPJz3SglTUwanv158G/gEaXlMCMB40ESWzCUpYKLbM1YyxNUr/eRTvB0dj
         q5bfYMJAtmuQxNRrb24URkk4yUGvJWiiXK1BVCnHsuv6mW1WURerDLHi73JhCSJTvRuO
         ve4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530197; x=1795134997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fM5KcKeiT2dFtKAL44kR4N6b9OYdh4IfZpoD9ReFTN0=;
        b=FqgGKtAmOM0CgUlorilWubnrQNMC6OSNdJOfaG2h7nLLVjaBHmQtQkl+ZJoJ50NUgM
         u52CYS/i85lI6I0iDBeh2zxy81BBNu/g2RgVh2+ugLOQHtejKnFxBSyeTkgewkiaULIA
         J6Dd7ohgaqSmezjksncGynHMUeeSGzL9A8FX1ssV9LIuwMqcfZF653jT10HcOT36L8aN
         Kr63DS5IamsGhKhSMdVvRdGRppBPxE2kP8hwM6tqb/fHz6n8+tCG/wbckDQJjR9CjjCA
         cJPuV/bnP2t1gI0XR3whS3JY2ZAgEV1Jk4OECPR5T/4K5fXYwP1T5wtFCCi4802KGSnl
         KPSQ==
X-Forwarded-Encrypted: i=1; AL+hErEu9Hf0H2E5f7hAUvLTG9/nFjnzdMe+yQzPh0YkGcF3Or1B8RzYZHgrO/C+fDAmRq8sv4oBkFkmTgOqLZUvzW+5@lists.infradead.org
X-Gm-Message-State: APuU4Z+b7yyy7/O09x8fuXYiiAOvwXuuMB6YXtgWm26uTnuZthMWSb2B
	2f7mxJcRjyISA6nuJrCUIL6QR8qGWv9VB0vJ/q1dmasN60C1h7a4zAsSCYWVtk1qn+g=
X-Gm-Gg: AYBFou1OgEvwKsv+UV7BRDlZ1P8JiBCTwQ4ZlUvMljJyVAUlIlAUNndXMmMcFAFYu8h
	YspcxPfn74P2XZIs1ULHDeWIbGoqQnJ5yArcdulAr8Esf//hu+n3rc5d/gg+ViBPsjSV2uQnEtm
	tlqPWU17B1CUtH/erzCpjh+53Bdy9ZNUo07M6mZxINcY//rL8FudduFVTSjYPHU3Do/fmsztc7Y
	op5u3PhS5p2MtJyGmfd+CwhympQJnyJM252mT9eUKhDE3KyDW8FX+1kuuB2goXrUxg7s/zFnDvk
	aW9fSx61p7QqF7O57qy+6ponYQpZKYs4cQ86eR5UHpCviHjRYKPx0ccXGM9m+owRRh6wSQqwdSm
	QieRcqS/eHTn85fOQVQkP7bcLwV77xHBQeru/7AYmgdiF8adryx5KWgDCFC3WIo0ksNEP64Ls48
	FolLGECIhttHZSDheNlZtXYwTR59zynAGj1I8P55BNxfcbb+gVx0loN6PQoHssvnRC8xb/aCUQt
	jx+9QTDa44rIKORqOwKlsLyD+MPQ1oZDJr3g2xuwXtsverYGUOfrhalj1pZeKR5Ruv6uYGmAekC
	RX67+uAkJQ7u8L257F3tgYJsIgdQJ/ykyloGdVQyM7dEuOSASwX9ThajzEMU0ULcDs9RWJG4tmv
	OS58IU3gEa0i58SBtFIwNU5QdGLzeoUsjvY/oNssNoD268SXLeyFBdHS37rx2ZZoWRiwSIAkov0
	9jkE7CN/lVc5/mQuO1
X-Received: by 2002:a05:600c:46d5:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4bb55a82b16mr17557785e9.16.1794530196723;
        Thu, 12 Nov 2026 16:36:36 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae4414sm20340685e9.9.2026.11.12.16.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:36 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: stefandoesinger@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org
Subject: Re: [PATCH v2 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE ZXHN H3600
Date: Fri, 13 Nov 2026 00:36:35 +0000
Message-ID: <20261113003635.3664249-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110153522.1620088-1-isasmendi.agus@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261106190828.3823287-1-isasmendi.agus@gmail.com> <taToYWqTRsyGXzOXNcd5Qw@gmail.com> <20261110153522.1620088-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163640_612232_C86F79B0 
X-CRM114-Status: GOOD (  18.48  )
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

Hi Agustin,

You asked on 6 November whether I saw the hang with sustained Wi-Fi
traffic. Yes, and that is why my first submission had the lock. The
OpenWrt build on my unit keeps it on both sides, and the unit ran for
37 days as an access point with it.

One more case for your table. With the lock on both sides, PCIe config
reads of the MT7915 still hang my unit. I ran two loops, one per CPU,
reading the config space of both functions from sysfs like lspci does
while mt7915e was loaded, and the board stopped in under a minute. With
mt7915e unloaded the same loops ran for 5 minutes, and so did Ethernet
traffic with mt7915e loaded and no config reads. Putting the config
reads of the devices behind the port under the same lock fixed it, with
two 5 minute runs and no hang.

Agustin Santiago wrote:
> - a small patch so that l2x0_of_init() honours the status property

Agreed, and thanks for sending it. I tested the early return of your
patch 2/2 the way you planned it for v2, on my unit with 512 MiB and an
L2C-310 r3p3 and with the cache node disabled. I booted it with kexec,
so the old kernel had already turned the cache off and the control
register read 0. That does not show what the boot loader leaves. 40
minutes of load ran without a hang, the last 10 with about 190 Mbs
of Wi-Fi receive, Ethernet send and the config read loops from above
all together. The next version of my series will disable the L2C in
the DT. I also tested your v2 as posted, and my Tested-by is in that
thread.

> I haven't measured the cost of the L2 off properly yet; I can do that
> if this direction sounds reasonable.

Here is what I see on my unit with L2 on with the lock and with L2 off,
the same kernel otherwise.

                                 L2 on       L2 off
  md5sum of 256 MiB of zeros     3.6 s       4.1 s
  dd 2 GiB /dev/zero to null     1.2 s       2.9 s
  TCP send over Ethernet         211 Mbs     41-55 Mbs
  TCP send over Wi-Fi            200 Mbs     196 Mbs
  TCP receive over Wi-Fi         171 Mbs     133-140 Mbs

The TCP numbers are a single busybox nc stream from or to the router
itself for 20 s, so they show the CPU path and not forwarded or
offloaded traffic. I also measured forwarding through the bridge,
between lan1 and a 5 GHz client, one TCP stream each way. Wi-Fi to LAN
went from about 470 Mbs with the cache on to about 330 with it off,
and LAN to Wi-Fi from about 405 to about 325. A few LAN to Wi-Fi runs
dropped much lower with both settings for a reason that has nothing to
do with the cache, and I left those out.

Because of these numbers OpenWrt will keep the cache on with the lock.
Once the platform is in I want to try the lib/logic_iomem.c idea Arnd
suggested on my first submission, which might let the cache be turned
back on without changes in each PCIe driver.

Best regards,
Navid

