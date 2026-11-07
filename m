Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30013606D827
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OzAb8LHP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gqBwnHBb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fe4F4dXUwFtHilALHNjDKqLA8kT583a1m+7DZY5OsBc=; b=OzAb8LHPELwQoj
	Zrb0CTf+A5zzR04v7EfvhgMO+lu9noVl7RaFsB9Xd88GNuiVS9jKnL+ZO3MeonWiiNnCeHz2p0BSM
	OragmHSdTV0JRli0fTi1zQYYZbdSoXtude7z91zCpGNRQMl3TZCsmSZNuNUD/XOaytU9qw0B9fmCX
	8p3EKyGpdj5iX0r/wZMj+hHqFnBSCGB/qcytSKrOXfEUqRaoB98q9KUl2r+2XLXIMwjWTSo3gtFbS
	m/aW43i4xO0ap4LCUbniso8ccktvsK5zlSFPpZiRLtW19cCkgzsrv+49YgVIzJMan+J/tHIfbXWzv
	/tOZjRptawp2Lk1Yrm5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjrh-0000000F4lU-0CPm;
	Sat, 07 Nov 2026 17:06:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjrf-0000000F4kl-49jg;
	Sat, 07 Nov 2026 17:06:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C9F16020A;
	Sat,  7 Nov 2026 17:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991641F008A1;
	Sat,  7 Nov 2026 17:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794071162;
	bh=Fe4F4dXUwFtHilALHNjDKqLA8kT583a1m+7DZY5OsBc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gqBwnHBbT4ltjC04v5T/t2uExKYybCerw9doHxHPyU8ZjB7LhTARzIskVeS1s4LsY
	 niBjboNRR3EEqKstWkSmfEyI0DI/5lK2LS8gZ0SEkSkxuLVvP4IHNTGZ7B0nFdWLdv
	 SriFBZ1beIye7YD1SV6ffuDrMOUZeQ+PsZ4z1Ke03+WZN/bXPee09MrElNMgwPt7tC
	 6WVFnI9qER3+JTIRHSyuIju+QyVvo3w7KszLuVp0koF3g/OG8Jhgnn5EM2Vd6odkRf
	 IH7zZMz0qk0jr5pNVQepPry2IH2nuCl66eMzB0Znga6KdrwqE3+cmFX0Khr5tnl3pr
	 kWsxvBA3mAGVA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Igor Velkov <iav@iav.lv>
Cc: Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261103-rockchip-pcie-async-v1-1-4dcadb94af64@iav.lv>
References: <20261103-rockchip-pcie-async-v1-1-4dcadb94af64@iav.lv>
Subject: Re: [PATCH] PCI: rockchip-host: Enable async probe by default
Message-Id: <179407116151.87338.4711703729751463299.b4-ty@b4>
Date: Sat, 07 Nov 2026 22:36:01 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 03 Nov 2026 06:07:35 +0000, Igor Velkov wrote:
> The probe waits for the link to come up, and with an empty slot it
> holds the deferred-probe worker for about 0.7 s. On ROCK Pi 4 with
> UHS-I enabled for the SD card, the I/O-domain driver then binds only
> after the card has switched to 1.8 V, and tuning fails ("All phases
> bad!").
> 
> Probe asynchronously, as commit c0e1eb441b1d ("PCI: qcom: Enable async
> probe by default") does for the Qualcomm host driver. This does not
> order the I/O domain before dw_mmc in general; an explicit dependency
> was proposed in [1] and not merged.
> 
> [...]

Applied, thanks!

[1/1] PCI: rockchip-host: Enable async probe by default
      commit: abc53e14b57aa29fb0ec822a2a9eb5b279cd05b0

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



