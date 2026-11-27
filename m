Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9F0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 21:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dJo4Na5/;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=e5V8y1Ur
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q3m2yyt50RINKi6ioBAszyxO/hF+Qz9GpX0rwheQRCQ=; b=dJo4Na5/aoq7gj
	oomRfRQm1bC3+D9mONa0q0pP/ZwcFyWzfurXVvb84fVPs709RJtHohtQr+Vve0ncw8quDMy2/8It/
	ZB8iMCmtpYuWkU+HGIkYOhQ5rvwYdmvohjKZPHFRNCPl18nR/7YOTriPflAN0xAShZQ2/cW5dkHr+
	EB4IhukDxFP5P2VAhGu4X3xjRlvdEJz4UbC7rmfAgVRgvdozbqt4TwKcVa4xaP6Zy1LeS+Isfsueu
	zwqxUIZ9wWTRxGEOP1OfgYTXRPaHXDep9wvySKK++xiLYgQmTx5TI4W3v4NFCmCeeZuJ0gtu/53yD
	889TD+W6dLNlzHcdIP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX3X2-000000007D2-0duL;
	Fri, 27 Nov 2026 21:31:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX3Wz-000000007CX-1p5D;
	Fri, 27 Nov 2026 21:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=q3m2yyt50RINKi6ioBAszyxO/hF+Qz9GpX0rwheQRCQ=; b=e5V8y1UrtccmyPxmIkUjF2ky3U
	exC1EK59wpjZe9T+uL8fDgx5yQnFLqvPPdf5wVpYR4AJDFvFarpaJ0we3NixMOBz5+Laf3+VkDQ7c
	gGFyGoHCP2domoIm+STqlYwwvxhnqjGKFJp4CATKCk7mjuX4buNRea9eF2/OCuvT5QKSOsg9LJtxy
	nBhWutwfY3LNRTLq8udK7VI8Xer4qBRRmVo6k5Yy53uJn5cAssMH+2HjAOh2r6o05sUCp5yAxDq/q
	iZx2haoFDURMSaUDE0TqY/u7XuVnsgsJF/a+SomX4q0VkDbQ5+b83JCXnYzlI8whw7zKYHkXjGKJQ
	7BICBRrQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chanwoo Choi <cwchoi00@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: add RK3588 DFI clocks and RK3576 DFI
Date: Fri, 27 Nov 2026 22:30:41 +0100
Message-ID: <179581499871.254621.2470437130945394639.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
References: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_133057_835326_4156CC3A 
X-CRM114-Status: GOOD (  11.30  )
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


On Thu, 26 Nov 2026 15:52:35 +0100, Sebastian Reichel wrote:
> When RK3588 DFI support was added, support for the clocks was missed.
> This series fixes that and also adds the clocks for RK3576 as well as
> RK3576 DFI node itself.
> 
> The DT binding for the DFI side already got merged together with the
> driver changes today, so there is no dependencies for this series:
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: rk3588: add PCLK_DDR_MON_CH clocks
      commit: 76c1bc06e04007247ca47e45d7313c24ac0b2570
[2/6] dt-bindings: clock: rk3576: add more DFI clocks
      commit: 2268455f297ec61b42ab44dfeaf982d2af370255
[3/6] clk: rockchip: rk3588: add PCLK_DDR_MON_CH gate branches
      commit: 2fb95541b66c05384c75259f06d51efa69e16bca
[4/6] clk: rockchip: rk3576: add missing DFI clock branch
      commit: 8b8862a19dc62e1fd838ce3eafd43382f78d4d01
[5/6] arm64: dts: rockchip: add dfi clocks on RK3588
      commit: 6046a394edaff1e6f67911ebe4ef0f508a9f82cf
[6/6] arm64: dts: rockchip: add DFI node to RK3576
      commit: b4f857a1d2ca5999295247933d29ebaf3b5377db

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

