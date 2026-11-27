Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54039606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J32fMBjh;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrGEsf9R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3w20wn8ciMIi314K9ZKRgL922tIUAQ1fVj1q7jFt11I=; b=J32fMBjhAuW3mh
	2V1tb3QJWyy3JGW9akREM3bGKuFDaH6fZiow+ghmSDKI3MoKozRcm7n6Ht0tdqiAFeRktpShM8vGD
	NvZty3U7Kh/Ph20tifGPuJb+0epsfRIAZ43TinKO/TTx5VEZQW1iG2LiGKwLBabIVOlNDPVFewpzY
	M6MSoZaUk9suxz6OszIw5wQXvm4+G0wwqqVZ1VScpHn7R46kZ2ZQIJjlg6RIP/9Ri6uuHSSIOsnLv
	jTZ5QLHLAAGUSAFEbU2TlC6a/jHDxivkqXHqH7+cHcBw4oKspHkFE7K+3qKfDdqKJ33+co07dYE4e
	YeQK8oxSraIO0uT6i77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuql-0000000G227-0T4w;
	Fri, 27 Nov 2026 12:14:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuqk-0000000G220-3RY5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:14:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 247854187D;
	Fri, 27 Nov 2026 12:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA841F000C1;
	Fri, 27 Nov 2026 12:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795781685;
	bh=3w20wn8ciMIi314K9ZKRgL922tIUAQ1fVj1q7jFt11I=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=JrGEsf9RGSAi95mThpsPZiqwBb8CPAROQvgPolW2qIJ2xXEk5VJKACzsGFeqPtsMk
	 12STunPm5NpI3riSYWarempFNzU3lBP52Nu9ASxRNvvlCt5tbzD/Hw69Mx3qSnEwze
	 Tixfxfhgo095X1TISXxrvq2kWiGqVrUKHT1E9npI8SB7mKrHS/umAuWt+Hx6/XLiPW
	 CxkomSEuUSy3wQR8uAzWuBAWKwnbwVNUjdHwpE1WFY5jnYft8hPuN8KnQgWOuemKqt
	 DFUFi5a6yGXRGOdEjpfbF1YQa23ZPwEuA+i7DRrh/a6UUpOg1fAbG/YbyqIeU2kgn0
	 fWfCj2t0bN5wQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 0/8] arm64: Unmap FF-A lent memory from direct map
From: Sumit Garg <sumit.garg@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
 akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
 ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
 ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
 danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
References: <20261111110738.872947-1-vdonnefort@google.com>
Date: Fri, 27 Nov 2026 17:44:23 +0530
Message-Id: <179578166371.172025.10770561998032628043.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=764; i=sumit.garg@kernel.org;
 h=from:subject:message-id; bh=H72B6Re7Lfo3dYJpngqffII6YfaUb4iqb0oxwd+0b1c=;
 b=owGbwMvMwCV2RWpxpe9rmzmMp9WSGLI5SzTqKoX2v6poOjM7Tepq5Ht5my8u93hEPXlY96rGb
 llxtjyvo5SFQYyLQVZMkSX167dp24T+1YZaneCBmcPKBDKEgYtTACZyuYeRYavT7sI3m/SebpyX
 onf6hgPXAYGpWw5ElojkKeqEbHUztmH4w+Vd9c3uxqQ7AhKnb8xtPv11xZuQkk5zO+20IpOs84t
 N+AA=
X-Developer-Key: i=sumit.garg@kernel.org; a=openpgp;
 fpr=65F5F696B612FE7D553AC80CD41AA3794DEB3C9C
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This series is a follow-up to the discussion that has started here [1].
> 
> When memory is lent to the Secure world via FF-A, CPU speculative
> accesses from NS to the lent pages can still occur as long as it retains
> a cacheable mapping to it.

One thing I forgot to ask during last review, in case of hypervisor
support like pKVM how are going to handle unmap from stage-2? As I can
see from code pKVM doesn't support FF-A lend calls to unmap pages from
stage-2.

I think overall it is important to unmap memory from both stage-1 and
stage-2 to avoid CPU speculative accesses from NS when memory is lent to
the secure world. Is there plan to support stage-2 unmapping like in
case of pKVM?

-Sumit

-- 
Sumit Garg <sumit.garg@kernel.org>

