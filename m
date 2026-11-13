Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8051760A381A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YTi1XmGV;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Fq6FkOsr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KL61sUxGGXBLoXiDN/MT8f5YU0XPMLUvi7kW1YNxd5w=; b=YTi1XmGVIZgByw
	bxMByHGfaqfAiJUyO0Jrap4SFBKuA7oFAAe101xK+x8fq+jBCNOZWX/wRf/W63rkQ1VJdWB3lqb4z
	GM3adoVhprfVsXoLzBmYwx6EBkktNZ0QXloGD+G+E8Iomwt8brXE/pYuG4hX/Ryyv+rIdsZjgpmNU
	y3JVTXtBpYfZUxLydYpqVMekEM1/50isHni0vrTBWsC0fzYaS1dtDixkB8VtTPMtxEG34zT4FSdvF
	/h+Wmkq946S/lQMt0bgudC9+8y95TFlKAomZvCH9vWS5aNckFbGTYGG4l407LoDH40seq2bcrNhzf
	HNaM+xn+dgKLWQbzrSUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyVi-0000000EWvz-0cVs;
	Fri, 13 Nov 2026 21:08:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyVK-0000000EWlF-2s2s;
	Fri, 13 Nov 2026 21:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=KL61sUxGGXBLoXiDN/MT8f5YU0XPMLUvi7kW1YNxd5w=; b=Fq6FkOsrggmsp8mQ2lX6leF3JL
	G2Xu+3xGCgwVm/HxXjIZr1p46QA4Y0DNs9L5+eh/pMO9xPa00hg34VjICP6NT+nePRGSSGtcKlQtQ
	Ezue9u3CwCzQ2GnRVquBzdp2q14X1kxeDvPeGKdxF0gOpn14xzH3kq80S2XXQgUBPGPBTPxU1m6O2
	nE9AXoEwNgr6ryO5EzDx3MVXBQWAfyC1ZOGlSH3tRU/heDHuPVAo2UzQbpdO321aRVJNjr/6NbOPS
	pSHVdP8WjpwznDkCCqwl99mp4RHIzy8Rgo7XrVMUPeCKoENGtkl7CTMEmQwYhjOL2YExxymHUIE07
	K0QsAYWQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	robh@kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Describe more of the power tree on Kobol Helios64
Date: Fri, 13 Nov 2026 22:08:03 +0100
Message-ID: <179460406460.1165597.4015563597141303036.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108-helios64-power-tree-v2-1-639ac2fc5ad7@iav.lv>
References: <20261108-helios64-power-tree-v2-1-639ac2fc5ad7@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_130814_783125_52D70749 
X-CRM114-Status: UNSURE (   9.45  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sun, 08 Nov 2026 23:00:18 +0000, Igor Velkov wrote:
> Add the regulators that the Helios64 schematic shows and the device
> tree does not describe yet:
> 
> - RK808 DCDC_REG3 vcc_ddr_s3, LDO_REG6 vcc1v5_s3 and SWITCH_REG1
>   vcc3v3_sys_s0 (sheet 6),
> - the fixed 0.9 V regulator vcc0v9_s3, fed from vcc3v3_sys_s3 (sheet 8),
> - the hard disk supplies vcc5v0_hdd and vcc12v_hdd, fed from
>   vcc12v_dcin_bkup (sheets 4 and 9).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Describe more of the power tree on Kobol Helios64
      commit: 6c9bd34d299ccf3cd1374a79749f9509059f5bd7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

