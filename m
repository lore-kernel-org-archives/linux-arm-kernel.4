Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBAC606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h2szbhD3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0q0MLo3BGWILZ9gNyuQzc7su8itTZ84AHzV6dj/fCyc=; b=h2szbhD3jVCbx1
	KA0h2Wu8RsryjttVhHz5jn1cKg8N2kZUKentwGAkSelH+wlgu3goUk6WaTAZtIFiLtVHO901RgTYy
	sXs90KR+KE+Kgqp6KlDwlLUe/59hpbZcZX9z3uSI7cR+TO//G6Las4f69U4u3QyYQ4yE2mx7hXwNl
	HDu30VEkga2RXKkwunSaK36Kek3KTr2bs457n/QDOYs/bDyBzBR0lLqySsI8rvNxUMvj2amtnHpFp
	ukEV68yiW1nBGvS2O8+8dZiPGoTPGDF+0JQOo1Sa/BTbOs8gwdttQ8nNvJo9Mf7ROI1revTPSwTNZ
	u8Khy3lKtt1EiiXamgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWH6W-0000000AmZD-0PZt;
	Wed, 25 Nov 2026 17:48:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWH6U-0000000AmZ4-2HAC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:48:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45C994169B;
	Wed, 25 Nov 2026 17:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6CA1F000D1;
	Wed, 25 Nov 2026 17:48:15 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] PCI: xilinx-nwl: Use devm_clk_get_enabled() in
 nwl_pcie_probe()
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Hyun Kwon <hyun.kwon@xilinx.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Sean Anderson <sean.anderson@linux.dev>, 
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>, 
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>
In-Reply-To: <f691bbaa-ddb5-45bf-8f85-fcf354a6af03@web.de>
References: <f691bbaa-ddb5-45bf-8f85-fcf354a6af03@web.de>
Date: Wed, 25 Nov 2026 23:18:10 +0530
Message-Id: <179562889095.5580.5805178037943195830.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=613;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=oVmsAKPla0SSCmhlMgEfiLun7tvxgbJftIFjZnWKpuc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrBx9frFFBxMMzmhhHbjIT7NtxqGHjr+aASXO3R
 AwMZBOcjTmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawcfXwAKCRBVnxHm/pHO
 9dFJB/9chrc9j0yGBvYPUiJSXKOl8+2fWGrELXUciCWoJN7XzWm2ov7aOCjqzGof6ExhKjFDXjd
 RJIe2TsYOE3VBSxRi4fg7kveo3hepmJ8N5PldDkiPJJ3rhYzWw5wX9afZkrGkoK45Ro35TwAef2
 DXJxBSpGL3wMdt+wR/wTA9V8c/yBCU4AawHFprtwcrZIoGv19uV/KgsbGhAPbJkGnauqp19JD9X
 UfKMryv65/6uDeHRiExPLAEI4Ow33Xuovl2RykpvSrJ5LaVzEWpugw15cx9Jfu/V4b3L9QcQtTI
 WNYzYlR4miKw8U8qBnsEW+QGFFeZqPdGC4nkORJH7zB281z3
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-22 20:52 +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Nov 2026 20:35:35 +0100
> 
> * Reuse existing functionality from devm_clk_get_enabled() instead of
>   keeping duplicate source code.
> 
> * Omit a clk_disable_unprepare() call on an error handling path
>   and in the implementation of the function “nwl_pcie_remove”.
> 
> * Delete the label “err_clk”.
> 

THis isn't how the commit message should be written. It should be contiguous,
not bullet points and just say what the patches does and why it is needed.

- Mani



