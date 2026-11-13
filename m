Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EF5606A88E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c2wAm4Gk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AqHo836m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VvQJyhwgQ+YhbM+FtddDOciD0h7PQaqhxjTy41nTAJE=; b=c2wAm4GkkV98Tg
	g3AQs0rJGzvvP9hPcBvCA3gounXiS3fZQd3S/+j04s5GgmtUOCpEzeXFkXOGvjDsj9VMpRQpdi7KQ
	XjzJm/iyjZd102uFEA1ENTJ739uoZpUJJgV51O5ZRVwWUgobF+q2YP9xVl8b06REoFGPvQ04a14GE
	1zs3wVtY5/pskTm31nTyOCnqvYKX5W/SINemDT+tH4WJe+0aAo4IPG3biIKzHD5pfzEDF/AcyrZR/
	b5ELjRx2QGTUugDWfHQ8XOsThBbx/E+sbpsVrm6+lSrOo07YqxpGyl+BczJCsRDEneZLp/HMrSt84
	YbdoYx5fPVOZS3nJ0IcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxX5-0000000ELAj-0mIm;
	Fri, 13 Nov 2026 20:05:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxX3-0000000ELAQ-2Xrj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:05:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 16D31406FB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 20:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C521F000C7;
	Fri, 13 Nov 2026 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794600357;
	bh=VvQJyhwgQ+YhbM+FtddDOciD0h7PQaqhxjTy41nTAJE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=AqHo836mxfkCHsx9CdZoTG3M66PmGwuMD6kk2cYs4gZQ4EdDQfyT4DYzJyMzQzLtD
	 wVi62IN+nPbMbG2aviIWa5Na6J30LQLbNQCePvLDDIZQzXjNBP29mHaoyVvAU7sTN5
	 OQhgcGVNdJaVsLCnjcmgCPgcsiLa9hamMcvuD4PEklnu9C8F0G1bBAvWtvumzfdchc
	 r2cAeNsCD8Mnhyv8KP4jDWwsiAX1XZxaCWrd/5ihG+UF9aPsv4eBVTNt1dX4CaJ67P
	 RmXrcVAOqHunGcec5wPIRvOsZ79P2xExmv2kI9zfcurOHy1bD6tFOcFE10mHyJGn0I
	 lLom6cKyKpHSg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8B4E8198003A;
	Fri, 13 Nov 2026 15:05:54 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 13 Nov 2026 15:05:54 -0500
X-ME-Sender: <xms:oG33ala2Qs4dNCz_pgKY9qRFkQNTC8Md8bjb0LxB46k3LYEbFL24aw>
    <xme:oG33anO6D0ny--CeA8YHwhOR2Bnxkws17cmN25HV8MXK2cJ7kSMiFxQLvCKELokaa
    _P9FBJN182cikAmS_EWuQU6f2s5w5re3_lzq_YaU2r3zedxLFq2yi9M>
X-ME-Proxy-Cause: dmFkZTFrh2j1YerPcsdYSEJl2fuNPZBBkrWfKhKGJpB+r05OZ52nQHlNbhYFKI0raic5S0
    5bMlCyChL49t3w8ZhhOR0NlNe3z9Lg7QBBiJ59KgCh1sycLWSK809y0RE5D/RanX5bwkrc
    EudQ9Fb7dAjmpZGKgucomUumnKpy8W0Ifj2G/RKLfrE67vIpEVZmZLp2GFgvO65vFSLxcv
    +k7OYpW55f5SLyKg+v3yrBkk34QdbPV0RCfi+OvplFq/xqwI0LylgEtFVmCLGUyZvzK/lB
    joRJw+3eq+P+s9M3NmX+1p1vZU043sdwYPKegHO9x2WqAdMAwNOhQR3RorxmNswidt5zkv
    hJVDuN6TQrb50u5stQadctkO+AFYznGeqlthIJiuhnH9e6cQFD+7x4XCSZ60HbgKOaTYxF
    tIl4yKFaQ4aLE3fwHNRQ99xcInMXWkrZDGLOJMIa1+jBcePoyMS5liR4ibrgMaOEWY2mih
    4IVSRU7Xb3Mqn1LqYgWN8SGE2Bz7yTt6B3sKJ3//eXRiqQdfXcWUZ0n0CcQMy3kI/eHVs6
    mfBsgf3cLFx9Pe5vb+hYqKSSuLVMgavmAWee3WBa4WNK7/kegauBOUj4lOghBSwIaWgxWy
    yQ5mOeLhSTkY5m4sG8j6E8abAfc9Rqgy7aT9SUPpBGfe041MC/DINB2qovsw
X-ME-Proxy: <xmx:om33av8JIDuF_Ma5r_he8EYFJwpuPdP3VGQh-jAlBjKuqbSUBCatiw>
    <xmx:om33at9fgU3GD5mjgAg1Ga21D6YsgKrJ_wdZicKzXvTcqeRoj0KDng>
    <xmx:om33avQHEOsTYqaVrKaWbbE4tRwGGfUvyQ1AeBEA3AgIlwpf6sUL0A>
    <xmx:om33ahcJmPgNrYZJ-_PouhKo7piju3djExvLGCz_NLgX4u1PmOp2JQ>
    <xmx:om33ajBdzwsFsd6xdno2q81dxNKuZUS8sa3B9bO6gXyXwln_S5LnVrFj>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D33FBF8008E; Fri, 13 Nov 2026 15:05:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 13 Nov 2026 21:05:32 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, "Christoph Hellwig" <hch@lst.de>,
 "Eric Biggers" <ebiggers@kernel.org>
Message-Id: <b7f72b97-6e8e-4b07-a2a1-6ac8c6e596e4@app.fastmail.com>
In-Reply-To: <20261113190150.GA2857474@ax162>
References: <20261029135020.272082-6-ardb+git@google.com>
 <20261112222720.GA188816@ax162>
 <bc58b973-3d54-4480-aaaa-f5d5269418ea@app.fastmail.com>
 <20261113190150.GA2857474@ax162>
Subject: Re: [PATCH 0/4] Get rid of all NEON intrinsics stdint.h type hacks
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

(cc Catalin)

Full thread:
https://lore.kernel.org/all/20261029135020.272082-6-ardb+git@google.com/

On Fri, 13 Nov 2026, at 20:01, Nathan Chancellor wrote:
> On Fri, Nov 13, 2026 at 09:23:03AM +0100, Ard Biesheuvel wrote:
>> On Thu, 12 Nov 2026, at 23:27, Nathan Chancellor wrote:
>> > Who do you think should take this series? It would be nice if it could
>> > start making its way to mainline sooner rather than later since tip of
>> > tree clang builds have been broken for over a month at this point.
>> >
>> 
>> Are the first two patches sufficient for that? Perhaps Eric can take them
>> through the CRC or libcrypto trees, and I can send the remaining ones
>> through the respective arch trees the following cycle.
>
> Unfortunately not :/ we need the third patch to resolve the error since
> that is where the conflict is originating.
>

OK in that case, maybe Catalin can take the whole thing via the arm64 tree? 



Diffstat:

Ard Biesheuvel (4):
  lib/crc: Don't include <linux/types.h> in NEON intrinsics code
  xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
  arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
  ARM: Drop stdint.h type overrides from asm/neon-intrinsics.h

 Documentation/arch/arm/kernel_mode_neon.rst | 10 +++--
 arch/arm/include/asm/neon-intrinsics.h      | 43 +++-----------------
 arch/arm64/include/asm/neon-intrinsics.h    | 24 +++--------
 lib/crc/crc64-neon.c                        | 10 ++---
 lib/raid/xor/arm/xor-neon-glue.c            |  3 ++
 lib/raid/xor/arm/xor-neon.h                 | 16 +++++++-
 lib/raid/xor/arm64/xor-eor3.c               | 15 ++-----
 lib/raid/xor/arm64/xor-neon-glue.c          |  5 +++
 lib/raid/xor/arm64/xor-neon.h               | 31 ++++++++++++--
 lib/raid/xor/xor-neon.c                     | 16 ++------
 10 files changed, 78 insertions(+), 95 deletions(-)


