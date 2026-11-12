Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955C9606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tfYyOS7T;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=De6Oov7o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lslrIAZdUl5SqfQhmQbz5D/P9z4CDhHQ70X5KL7EEng=; b=tfYyOS7Tynx/yU
	A7mByLyqrnqRnh0QdiFTF7gYkd+P26GftYNm5zjn3qO2KP4hIPB/eHrGNWylZntq5+16tEawRuUs/
	A1U33M1N9De2lx6gIGTfjPrhIBE1Xgqx7lOV1E0kl5Qz4cxWAFqHetCV07wX+zhm20uO2XgfwwcML
	1iPu8rHcAHohqdt6TVfzOz3+MLRJpgKY9XYamU+8iB2fnNqWNHdXJYQF8/IAr/JAil4jikYgSdodO
	s7p0so3YJjptrUBcfPxFXaOBFXet/xrOZ181AZuHrwz1hPUodV3Chsd2wW1LsarpLFavgRXoAFe6c
	dUw/9TyuWZw8Uf4TNg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXP2-0000000AYMY-0ZVe;
	Thu, 12 Nov 2026 16:11:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXO9-0000000AYF2-1eCd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:11:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so49055105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 08:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499859; x=1795104659; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lslrIAZdUl5SqfQhmQbz5D/P9z4CDhHQ70X5KL7EEng=;
        b=De6Oov7oqIwGq9Glz25cftMlmE2aRyPTOHJaL9Mn2Fw/m3WN6v0Z/x9ba7bJVPZm2N
         s00SpGCCiShUfHFaRcjmewoVk0rWGHDjv4cQENv7tlu1Xf51mUW6ysPMy/Ozk5N8chGV
         NjkEzGaFKG3/r4mgLhgdfOV9SaLOZrnIvjJaa4PH4HQMn6uBuh76/2LGyIZf3ZP7OYtB
         RXLgQE+4hug0AgCM5bBaxUxbFRP3kMHED5MCxNZ62pWzO/naiFqmsrl6AJPSi1qTLIbw
         K0pOqg8DqT6tTIdiWn407y4XDcF4B4/MFS2vFInJZA6AjkwkWHg9FD/lCUei4j6gJMin
         8XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499859; x=1795104659;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lslrIAZdUl5SqfQhmQbz5D/P9z4CDhHQ70X5KL7EEng=;
        b=AUr14VczR067c9KLpsAKljBgzlvKcdD2hPMzO9odR6FcQCdr6SUCW5FjrZ6UBAvkLu
         XIgwIbqbw/iSdpClz2PQ4++LAqwTTYJWg0vbcTov+0EtAJ7OyAOk9BO1Zbhl/m2PQ4Rv
         lW/wmKlmi7tbeSDoKPbHQzDkgZfwgPD3kocacMVqx7rfnsh0c7FFK8hjxaLeGZuLDkwL
         NXAWX2jP/HdjpxXxA0/nil+/Ek0PSOcJcLfoAHfoZXNYwwbR1fvAZ71Q3Djy62qBepnX
         zb11C1IFcW3nOLMhyaqEWsbmVfWGddQJcRdT/LpLHBngcUpFJRdKO+Z3Q2kV72QSVV4D
         gW+w==
X-Forwarded-Encrypted: i=1; AL+hErFHMdLRgQmxAmoK2x3W9wnCVT6AgfPX8ax2qjCyzPeRYB+hxksxVXEa6L1GuD9DyUYhQ2Dmw9bHnjiHhLgJrA86@lists.infradead.org
X-Gm-Message-State: APuU4Z/fREZ4A/dfcBFgX2rrGLavV6We0hzK7wobcyTXAYsU1YvU+TT9
	v5GEg9yARr03KHr/4A/kUyE7pLpiSTo7V10u28bn9HU62ITSlxfdq+zd
X-Gm-Gg: AYBFou0yU+R4FKOcPVXrFJ2XLYfBWE4LLNQ13gCzSJlhkQkJBq+bPEjANd5SOt/C0JJ
	3NTPB9M/UcdBdcYfMnnmPZ75s3XjXTE94BUBZAw7+7ZhqQ2TauXGiydqtT/dbl5t8UZQwLW9ofA
	n2BMNtnSWIPrxAwyVMImCRv63bZRGBQ7w/t7wJQfgreP3lESbosM4PVa0oB8J5y8keE8cDS37ZJ
	aMRSOqjB2uxAjiitKgXwIJNabSdrauTfUMgt0PzFL+rwayVGbffecdyqMwgGBlpsl3dEqzRk0sg
	M2HybM06CWiw74yOR1CSvowiR2azLb5o14QCkv9mHOMAyMS+iCp3EcpQYoSh5Yw+dv2hzTsgjqL
	LL7YajcokZh61ll8L8lgtNtLdiPBAFq3ajGY6KMpYGz4iPIyXpQjx27C/YaV83igZIucih/vqEp
	1HQUwPZsSxkexbe6TYa69rrb73dy03g77To0bC9Cm23FRb37o+3PEQ5jeAPzZCXanFjsZMzJmLz
	OYXayKsTqUEF3vEfwISylSHEAW0AmSrnHUGw29nH5rvI8zIBFoYS+PbrKL+1eqcWxd1n/DPOjt7
	5orx+/avL3yV1Ap85T3MGusgsozunxvNl9fpkQMs6Q==
X-Received: by 2002:a05:600c:64c8:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4ba0939db68mr119822625e9.28.1794499859286;
        Thu, 12 Nov 2026 08:10:59 -0800 (PST)
Received: from dev.Default ([2a0c:5a86:4d09:3a00:3c0f:a5ff:fe86:2946])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb51de7b91sm44822355e9.6.2026.11.12.08.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:10:57 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Navid Ghahremani <ghahramani.navid@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org
Subject: Re: [PATCH v2 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE ZXHN H3600
Date: Thu, 12 Nov 2026 17:10:56 +0100
Message-Id: <20261112161056.2278061-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <Lv-2l5qpSwW-LGAsxs8loQ@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <taToYWqTRsyGXzOXNcd5Qw@gmail.com> <20261110153522.1620088-1-isasmendi.agus@gmail.com> <Lv-2l5qpSwW-LGAsxs8loQ@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_081101_613501_DC2CAE11 
X-CRM114-Status: GOOD (  26.96  )
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

On Thu, Nov 12, 2026 at 01:02, Stefan Dösinger wrote:
> Is it possible to program PCIe mmio areas as uncached in the level 2 cache or
> tell the cache to ignore a certain address range in some way? If it is
> possible, is it enough to prevent the crash?

The PCIe registers are already uncached.  The problem is that on this
chip every access from the CPUs goes through the L2 cache controller,
cached or not, and that controller is where it gets stuck.  This is how
it looks from my tests (there is no public documentation of the
chip's internals, so the picture is what the experiments show, not a
datasheet):

   CPU0      CPU1
     |         |
   +-------------+
   |     SCU     |   <- filter: can send a range to its 2nd port
   +-------------+
     |         |
   +-------------+
   |     L2C     |   <- both SCU ports end up here
   +-------------+
     |         |      <- filter: RAM on one port, the rest on the other
    RAM     PCIe, switch,
            other devices

How I got the picture:

- L2C filter: read back at boot, RAM goes out of one port and
  everything else out of the other.  Using it for the PCIe range moves
  RAM to the wrong port and the board doesn't boot.
- SCU 2nd port: RAM reads sent through it still show up in the L2C
  counters and return data that was only in the L2, so that port goes
  into the L2C too.  With the PCIe range on it, PCIe works but the
  board still hangs, 3 boots out of 3.

So both filters only change which port an access uses; neither lets it
skip the L2 cache controller.  Test code and logs are available if
anyone wants them.

> Do you have a guess what's special about the PCI address space that it
> triggers the issue? It sounds like it doesn't affect other hardware or RAM,
> otherwise ZTE would have disabled (or just fixed) the cache entirely.

It only hangs when three things happen together:

- one CPU reads a register of the PCIe card,
- the other CPU asks the L2 cache controller to do some work (the
  kernel does this all the time, e.g. on every writel()),
- the PCIe card is busy on its own (WiFi up).

With the WiFi down, 150 million PCIe reads did not hang it, even with
the other CPU keeping the L2 cache controller busy the whole time.
Why exactly these three block each other inside the chip I can't tell
without Sanechips' documentation.

This is a known problem.  Marvell had the same one in 2014, and ARM
(Catalin Marinas) said the rule is simply: don't access the L2 cache
controller and PCIe from the CPUs at the same time.

  https://lore.kernel.org/r/20140407121304.GD3360@arm.com

Marvell could avoid it because on their chip all devices share the
CPU caches, and they also turned off the extra L2 work the kernel does
on every writel(), so the kernel almost never has to talk to the L2
cache controller.  On our chip only the PCIe (and probably USB)
devices can share the caches, after setting a few registers that
ZTE's own kernel sets.  The Ethernet switch can't, so that extra work
on every writel() has to stay, and that alone is enough to hang it: I
ran ZTE's exact setup without its lock and the board hung the same
way.  That is why ZTE needs the lock.  Making PCIe share the caches
may be worth having on its own; I'll measure it and can send it
separately.

> What does "TRM" mean in this context?

Technical Reference Manual, ARM's documentation for the L2 cache
controller.

So my suggestion for the ZX279128S device tree is still to keep the L2
cache off (status = "disabled" on the L2 cache node, with the patch
below).  It is the only option that can't break with whatever drivers
come later, and the cost is acceptable for a router: forwarding with
the hardware offload is unchanged, only memory-heavy work on the CPU
gets slower.  The lock works but was found too invasive, and the
lock-free variants depend on every DMA user being coherent, which the
switch can't be.

The v2 of the patch, with the change Arnd agreed to:
https://lore.kernel.org/r/20261112072953.989664-1-isasmendi.agus@gmail.com

Agustin

