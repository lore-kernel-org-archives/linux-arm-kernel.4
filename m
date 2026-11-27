Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F899606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aQYXp5wA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EN6sq60q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6GRLSB0LkFDh3Az2ScuINldyMH7GHPJZtPzhv3mBq9g=; b=aQYXp5wAWLFTCw
	4/jGX44Xrx60tiWP1w9FkbtQGtptURUsRCpscSbSkiC860MS2WhOR1uetgOil+hKVMFU/W8mO42Rj
	DKomW3cANgOSDUgz73rPbOUYf9Psk+7ZX3HU1K36ftiq9HOXhp4noqzDHj0oCGWtzxmbC4Qg5Wo3h
	uDt/8L3KtVXNJgyzN03AUaR4FIbxXsl8PG95oIKSizYLZpRlhHbB3EP2qKTrA/7QBIVptpNaJn6Hv
	5hhPU9mQD6gEKKvvxI/1z8h/k3Bv/Rm4U8kyOUFb2tVjeSRkDpfR6HaReKSho7NlHHqp7p8J07S8W
	Zq7KKcWGSNjUBor50bAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuI0-0000000FrMz-191x;
	Fri, 27 Nov 2026 11:38:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuHz-0000000FrMt-03wU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:38:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BD9E405A5;
	Fri, 27 Nov 2026 11:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568381F000C1;
	Fri, 27 Nov 2026 11:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795779530;
	bh=6GRLSB0LkFDh3Az2ScuINldyMH7GHPJZtPzhv3mBq9g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EN6sq60qKpx6cdKF+R79n+z5qwzaTKzvrcMvZzx+FKU6GBn2eC8+hm67fVNei3TQO
	 +ttGoxmqoregBZkwucAJ6Ey8WDnLmpLANL76xyY0a7v1bQfrsy3xvk/joA8eB0Ed0C
	 gIErMq/LjNOwX/1LRI1yKjn6O4Sr+TDieO7KNT7/mmws4jIebbYPAYAGY93AOMXQBF
	 IL7XMKJA47EtW11xsn+5VEor490XF+HwRykPTjra/RQ8SGJnD8n1S1PU0cUsqa2TCz
	 EtJmJhGwe8+jwKmZT6muAR6KvnGXRKQWU36E557J5sYLcPGIw52i6TU2jGQbHsoSZV
	 Cb7dE6bXAVsLg==
From: Srinivas Kandagatla <srini@kernel.org>
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>, 
 Peng Fan <peng.fan@nxp.com>, Christian Eggers <ceggers@arri.de>, 
 stable@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261125123222.839732-1-stefan.ghetu@nxp.com>
References: <20261125072736.769516-1-stefan.ghetu@nxp.com>
 <20261125123222.839732-1-stefan.ghetu@nxp.com>
Subject: Re: [PATCH v2] nvmem: imx-ocotp-scu: assign
 nvmem_cell_info::raw_len
Message-Id: <179577952810.26171.4681620361153963106.b4-ty@kernel.org>
Date: Fri, 27 Nov 2026 11:38:48 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 25 Nov 2026 14:32:22 +0200, Stefan Ghetu wrote:
> Avoid getting error messages at startup like the following on i.MX8QXP,
> i.MX8QM and i.MX8DXL, printed once for each MAC address cell:
> 
> nvmem imx-scu-ocotp0: cell mac raw len 6 unaligned to nvmem word size 4
> 
> The same was already done for imx-ocotp and imx-ocotp-ele by commit
> 48b5163c9575 ("nvmem: imx: assign nvmem_cell_info::raw_len"), but the
> SCU based driver was not covered.
> 
> [...]

Applied, thanks!

[1/1] nvmem: imx-ocotp-scu: assign nvmem_cell_info::raw_len
      commit: 710ea17029b60738ffe6c93e6da3ef6970727d0a

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


