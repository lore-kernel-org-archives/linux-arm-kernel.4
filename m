Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAF1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0k3wV3wK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H4mlvzh5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zdh7JKd+n/bFEUO+tVY/GwKaMe/9PGtTadA+erpvg0Q=; b=0k3wV3wKmqAk5PUSLwnFsYN05H
	fUPwHxav8fSK+8kReaPzSFE3rMLtNkDhyAyrG8OG7c5buh3SuDAAMEdOeG+GkGcoEn+pCZ9fYgS+s
	ii8TgWgT5Q3LUSyMYVfwUPEuOqodZ4qegcJw3iJg+ClgAl2SRsye2xKhukCSaRkj0ACby8Rj2gw36
	5+e7lhC9TGLkxmQ6MjXuVaqfFsa9GlBO/9OP0pBq+7Y2M+vMDtjHX5qYyDe2Ltyz+9985OcrXJTzf
	YegT027PfcaFLG+JpAPrJgoI+0Ga/ONcW0Q8lNUTKK/DPqcYck595F3ItnnCCA7zdKHwnisTItSWG
	m4armfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0QR-00000003Oke-15zU;
	Mon, 16 Nov 2026 17:23:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0QP-00000003OkM-3ByG;
	Mon, 16 Nov 2026 17:23:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 59D8E401FA;
	Mon, 16 Nov 2026 17:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADB71F000C4;
	Mon, 16 Nov 2026 17:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794849805;
	bh=Zdh7JKd+n/bFEUO+tVY/GwKaMe/9PGtTadA+erpvg0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H4mlvzh5r0sL0YISOB8wTSfjWPljjf4EU02sMMFNdz0rw7BVQLx7DAtJVsLRmxayZ
	 u/z/Ua56PsonECS2vNehIyGl70BvTy0M+vWgY57xUh2+Mem/KNCIlOv5fKCPi4tLAJ
	 vwenaTiklyWAi3+Fj+G6H+F7j1io2DZB9aZuqSdyMQVKV69WBT4RFwnheGoKE5k3/J
	 Z+CMthLun9rOLSNYdoorBi1Y2vAF3aeZ4Qgr+8OLU04yNP1UF6hI9kaDDqSOcZ9kFx
	 BNscAqdOUr019eIKBPhuQnjZWfXmLGnYgUe2gstUXIK5m546LHuS4DM5wFanO+5X7Q
	 eCNrre6j6ybnQ==
Date: Mon, 16 Nov 2026 18:23:17 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Yue Wang <yue.wang@amlogic.com>,
	Hans Zhang <18255117159@163.com>, Rob Herring <robh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jon Mason <jdmason@kudzu.us>, Myron Stowe <myron.stowe@redhat.com>
Cc: Keith Busch <kbusch@kernel.org>, mx2pg@pm.me,
	Lukas Wunner <lukas@wunner.de>, Frank Li <Frank.Li@nxp.com>,
	Mahesh Vaidya <mahesh.vaidya@altera.com>,
	Ricardo Pardini <ricardo@pardini.net>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 0/3] PCI: Fix and improve default MPS configuration
Message-ID: <avs8BTbSfZoTNM7I@ryzen>
References: <20261020122854.1500883-5-cassel@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020122854.1500883-5-cassel@kernel.org>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Bjorn,

any comments on this series?


Kind regards,
Niklas

