Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB30606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0GBOIDas;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hfvXfpNS;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=LrxyN98A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Dshu9qpsSYZT8eeZu5f7BohnpZTCm94WxOmlyxYqBw4=; b=0GBOIDas5tuq5MAe0LZ40hR3p7
	dDfxYSqvDP9X5OCJK23PLoteowSUK6O3OGBn1Z12SNm9KFSe9jFn6F7nVZY0Dc3s0DuMLxFD4Cym4
	gtcAmrmwuBlVwWtv3EHUlEQnTwlpagaaH5ZBjMYQLlaZM4Nvm06dor+MEEC61PnmtfMkGZmXzm4Bm
	sfUpa89fkHYQP+j9WeAkDaw2bnJcdzK63KikOnxV7kK8PgK/1pyFxcj95cHN1avZ5LLP/sbnlh+IQ
	vwF76ZLOCS4N0gWbVW0t+U0gnTqznNR5lUDGYLxy5o9sAEN1Q1BxaMZCQSonHvoNkrrs6AsgflLIS
	GgOOh26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxvZ-0000000Gp1r-3rwd;
	Fri, 27 Nov 2026 15:31:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxvT-0000000Gorz-03qG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 15:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Dshu9qpsSYZT8eeZu5f7BohnpZTCm94WxOmlyxYqBw4=; b=hfvXfpNSUkFoJhU79tY1W28qyV
	enYAzX7bx5tbjznJAz6wKlSAQGPEpy0Mgspu/+ngngCkj93PkM0UdTaBnNvWlwr4OH7EBehM/GbMu
	ay75+jVSDIS0HC0hQDbqZ5RgCNgEo4hMHnKhrlxw9qvKiw/wQ7+vcf7Dc+EhDUPnLLm+AapB7A5o+
	H6EISnlqKCdVKlVG4Qscp59/UG53cw1Brdc4duMZIKEdSBd5/7D2RHCUxcpy+ZXslZNBR8JPc2P8/
	3FdGHTv/Tc1JPItQnv1fWbJlC6t5NsdnKVWLQFrMDn3W34+EaB4GLQxJQMQ43yl/+l/LbsdUn78E3
	SPqryJew==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxvP-00000007un3-3or9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:31:50 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c5198302d38so638495366b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 07:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795793505; x=1796398305; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dshu9qpsSYZT8eeZu5f7BohnpZTCm94WxOmlyxYqBw4=;
        b=LrxyN98AbfwyW6ZKq87hudwJ97nB0RWcuw4e5FMHyWsRBoVN5Fne5ixGGWDl2EqPzz
         8/Vj42poipubiZmusz0KqGcEvtZ6pOgPPHj9kCrx5FpOgISoXbLBhEQbhRJouOcE9bh1
         1VWonr5f86KJswvdIbeW7wWq87g3+7cUv4T5jyphDPWY1t+RRnTNDa62s1dRusSZKAqW
         N1gN3C9DM1/ig+MCcFDXyxXSumP0r1wvjKbc07ad9Hl9GDzrUnHMImIhAfwmiUvva2Vf
         aYm5q1RJ+IdSZ1tXVpx3HbMMz+L6blHJ+vAjOzth/OxEabnZyHg8/wec13HoGXQrIGX/
         s7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793505; x=1796398305;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dshu9qpsSYZT8eeZu5f7BohnpZTCm94WxOmlyxYqBw4=;
        b=bgUY7A2XW40FVsV3ONTPv4litwKeoax11wvInErXOGa7zVjkHLMzVAFIjPOhJgsG2k
         fZR0qZpqyMknEAOaURqk3vpunHvd82zvaC17z7ZCX33AC73P10V5r25bSfT+qOKBuCwb
         U2lxe/kKRfCMASqWR6cciggoVpCLWm0dkUyoqVhL806INShVQl8CLdKeOhnhAoOgUBJo
         fcWWfWsGZHVttXDNs4l4ClqkRlSuuOnIWBz0OiCKE+Vs8W+mNFmxpOUZcxhJksfVd+/e
         Ur6gFuVbHO9J0wdVu6jhiL1WynL/1Ve5a4zFAPBMHnlfr7sfrkRFhTBUjN5MYB/14x/I
         tJgA==
X-Forwarded-Encrypted: i=1; AL+hErGIruHc6rEqGQI1JwMYNl2mnXxa69DSwS35yWv50JsSw8r/xPQQKgUL/HyRl3HmrNLAhz4WCKO8EJTtqNjl5AL9@lists.infradead.org
X-Gm-Message-State: APuU4Z/ki/V1SE/QXM85Co08bMnoxlnSq1lIxxx0C9X6KWTTQi3I4bAi
	yyEvdA2VChNitZL/XZH13JMHi20XfjtctS5DodSluinxNEOAufoEiSLPXfearvRHykI=
X-Gm-Gg: AZFdTZeIlNojA1P4OM15wajLCwjCujdVEuek75NuF+Vhtwbxyjuv4M9Xd0FshQxpj1C
	wO9ILwWplOcGjsxAXupDeWYRkWdcD0tZuUwXWa/J0AXVsqb0hFHqUWIlWjZI1g0xveBH4KJP8uc
	iq0giWZ2Tvg9uidG3KrrvFulW7eflMU9u1xosODW3iFAV/pGrB7S+bjF0r1ZKF1yAAdJILwI/IV
	gKjYubGnQYFi1NfF+M1Yx2IX8ZyreCahkjlDXvaNCitUxVD62ihAVewJEiyO73QJgmoCFz0d8pv
	aDBhZvPHwyVKTDlUaJSNdgTC7YxuQ1J4v0c3ftLHkKDWUMBnBULgIj5BmDsl1RE4QJYAy+85jbv
	i3zL4UvZ/wSAafsWVjcqVsjF3p7sK0wwTKT2ZftTHW9hc7iXWzhSpjAD6Zb5fLKx4xbuBPw4Ahv
	HGEF0nlTSVH9P0GLIi0hkSwVg4GuAheqYvzZE/E4buIZYTjm9v4LXEji4q2+T+8pAU0rOJbz0Ra
	QyY/dnnG0iKl0YLpVn7/VG8RjawOpWRg9sSsb2xhfqgpZik7CaUVh+DM2L0fwzAQaMTNV1zwDs7
	OZwTHmd4De/1kmgwGWs=
X-Received: by 2002:a17:907:9584:b0:c34:e9fe:82ed with SMTP id a640c23a62f3a-c513a88223amr1963994966b.28.1795793505180;
        Fri, 27 Nov 2026 07:31:45 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm47092498f8f.49.2026.11.27.07.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:31:44 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Subject: [PATCH 0/3] KVM: arm64: nv: Fix AT emulation for nested
 virtualization
Date: Fri, 27 Nov 2026 18:31:37 +0300
Message-Id: <20261127-nv-tcr2-v3-v1-0-9c15c1cabe01@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2MTQ4CIQxGrzLp2hqhotGrGBdQq1MXaOhITCZzd
 0Fdvu/nzWBSVAyOwwxFqpo+cgO3GoDHmG+CemkMfuN3zvk95ooTF4+VMJBw2IYDEUVoh2eRq76
 /stP5x/ZKd+GpG/oiRRNMJWYee/R3rZurN7AsH6p+2A2QAAAA
X-Change-ID: 20261127-nv-tcr2-v3-53ec5459333a
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_153147_965123_DBCD1098 
X-CRM114-Status: GOOD (  13.18  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes 3 issues found by our formal analysis at Pereq.

* VMs were potentially using the TCR2 bits which weren't intended for
  them.
* It turns out that guests could write to the TCR2 bits even when those
  bits are "hidden".
* The VMID wasn't handled correctly.  Roll over could happen before or
  during the AT execution leading to invalid results.

Changes in v3:
In v2 patches 2 and 3 added traps to prevent writes to hidden TCR2
bits.  Marc didn't like this approach and to be honest, the patch
had other issues as well.  Marc suggested that we load load
PIR/PIRE0/POR unconditionally instead and that's the approach here
in patch 2.

The other thing is that I have been trying to improve my review
process so I ended up fixing a bug handling POR_EL0 in __kvm_at_s1e01_fast().
That fix is now merged into patch 1 since it feels very related and
it gets backported to the same kernel.

Changes in v2:
1) Sashiko pointed out that we need to restore the original TCR2
   bits at the end of the AT command.
2) Clean up based on Marc's feedback.
3) Trap the writes to the TCR2 registers (normal and nested)

Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
Dan Carpenter (3):
      KVM: arm64: nv: Fix AT emulation for TCR2_EL1
      KVM: arm64: Load no-access permissions when S1PIE or S1POE is hidden
      KVM: arm64: nv: Update the shadow MMU's VMID for AT emulation

 arch/arm64/kvm/at.c                        | 61 ++++++++++++++++++++++++++++--
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 40 +++++++++++++++-----
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c         | 15 +++++---
 3 files changed, 97 insertions(+), 19 deletions(-)
---
base-commit: 5a7235e9adff42aa043ac9473dbeb0354dca0967
change-id: 20261127-nv-tcr2-v3-53ec5459333a

Best regards,
--  
Dan Carpenter <dan@pereq.eu>


