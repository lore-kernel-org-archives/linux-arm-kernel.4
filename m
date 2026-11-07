Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E812B606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jlMdl8It
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4kDuC6/k6afmT5ttyZKQqsIRg/10ImM6obACYHtMvsE=; b=jlMdl8It08sYgv
	Bs/jDS9wsYDD8+UEa0IXDvcxyOnF4yLhab/622P+261pe90XWCbvwVKDrto76w7LGny5Hn1YT3yAf
	Oz8IGaXXo7PQAXJyNyBA3o3plHamdMfg3XTwc67ZJwkynQJogogfDG6QLnqTi2CCVTdCwun9ZmtDH
	p6E8/4nNG4rFOldE8skZM8G6TZIkzxCy1l8QD5sokNrdd1YZg3VRtyxzDwXOuMWEhhj/TkToZRGee
	RsajLa1Ab3fpvulMgiCQ/W+Ei4ic/aeddx7a5KJt7tb+NoFgrEqvDH5rlHKiDHq7MJcjVcKKZRlg8
	ZAAOswAZtLWYBslRyVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjcq-0000000F2eJ-3MS3;
	Sat, 07 Nov 2026 16:50:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjco-0000000F2dn-3dDi;
	Sat, 07 Nov 2026 16:50:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FB396138A;
	Sat,  7 Nov 2026 16:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEE31F008A1;
	Sat,  7 Nov 2026 16:50:39 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/3] PCI: Configure Root Port MPS after scanning its
 hierarchy
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Yue Wang <yue.wang@Amlogic.com>, Hans Zhang <18255117159@163.com>, 
 Keith Busch <kbusch@kernel.org>, mx2pg@pm.me, 
 Lukas Wunner <lukas@wunner.de>, Frank Li <Frank.Li@nxp.com>, 
 Mahesh Vaidya <mahesh.vaidya@altera.com>, 
 Ricardo Pardini <ricardo@pardini.net>, Shawn Lin <shawn.lin@rock-chips.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Myron Stowe <myron.stowe@redhat.com>, Jon Mason <jdmason@kudzu.us>, 
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20261020122854.1500883-7-cassel@kernel.org>
References: <20261020122854.1500883-5-cassel@kernel.org>
 <20261020122854.1500883-7-cassel@kernel.org>
Date: Sat, 07 Nov 2026 22:20:38 +0530
Message-Id: <179407023831.65886.4898449607413795226.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2497;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=5LFctG0eiAz5gLJy+LkdgxdcQaH2WjiLxcMmdDJcNCo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq71bfk94n2KqPyxyjK3MxV0IdJr8qZsarNEVt8
 IzRU0v0pV+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCau9W3wAKCRBVnxHm/pHO
 9c8aCAChrzgEZVOZTm7ZdM+eYCmMceH2bCAIyzgIESMvYJdeHG2yqrmibfQqM5ZbaaRMGszjOXt
 +tCbtQLST72VVN5Brm7tfnMtAb7S0fws+9Xmf/72hBxC+uWQpIppyoA/sut+c++FRGvDltZkn/i
 zxHU2JzUikv8laW9muroU/YbV1xMWfkPiRbnNXMOD/mikdu4ttQw19CjNO/FNN4lR5U6hoRVAbc
 jf5yDayX+6FJ0RdKE0vofG+Th0UzqLOMI3lYHfvwGM9U1D+x8Lt1tFXppPrB+ArVxzs1iOLZwj9
 twETqh7xYX1ZJuNxMr7RWBKCAsIo8Pc7VpFuwfjWNZd0fdZX
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-20 14:28 +0200, Niklas Cassel wrote:
> With the default MPS strategy (PCIE_BUS_DEFAULT), pci_configure_mps()
> only matches each device's Maximum Payload Size (MPS) to its upstream
> bridge.  Root Ports have no upstream bridge, so their MPS stays at
> whatever firmware or the hardware default (128 bytes) left there, and the
> hierarchy below them inherits that value even if the Root Port and all
> devices below it support more.
> 
> Once the hierarchy below a Root Port has been scanned, and before drivers
> are bound, set the Root Port and every device below it to the largest MPS
> they all support, even if that is more than firmware programmed.  Do this
> from pcie_bus_configure_settings(), which the host bridge, ACPI and
> hotplug paths call after scanning, and from pci_rescan_bus() and
> pci_rescan_bus_bridge_resize(), which don't.
> 
> If the hierarchy contains a hotplug bridge other than the Root Port,
> typically a Switch Downstream Port, limit it to 128 bytes instead, like
> pcie_find_smpss() does for PCIE_BUS_SAFE: a device hot-added below such a
> port later can't lower the MPS of a hierarchy in use, but every device
> supports 128 bytes.  This costs throughput where firmware programmed a
> larger MPS for such a hierarchy, in exchange for hot-added devices always
> working.
> 
> An empty slot directly below a Root Port is left alone; it is evaluated
> when a device is hot-added or rescanned there, which also allows raising
> the Root Port again after a device that supported less has been replaced.
> Hierarchies in which a device other than a Switch port may already have
> a driver bound are never changed.  If the MPS of a device can't be set,
> restore the previous MPS of the whole hierarchy rather than leaving it
> with mismatched settings.
> 
> Since PCIE_BUS_DEFAULT can now raise MPS above what firmware programmed,
> apply the Intel 5000/5100 read completion coalescing quirk to it as well.
> 
> The other strategies are unchanged: PCIE_BUS_TUNE_OFF doesn't touch MPS,
> and PCIE_BUS_SAFE, PCIE_BUS_PERFORMANCE and PCIE_BUS_PEER2PEER already
> configure the hierarchy in pcie_bus_configure_settings().
> 
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Co-developed-by: Hans Zhang <18255117159@163.com>
> Signed-off-by: Hans Zhang <18255117159@163.com>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



