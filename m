Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A83606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GnDSku8u;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=XW5fo6x3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HxOJjxxAA23BtFl1yH0m4TU0F4sP/+f5RvSh1fFL9Xs=; b=GnDSku8unaFVpI
	z1L1muRr2XwDc24CsZY98aPFfO1VD9iLSNmygyMHEeo+qKELaKEfkmfYiHl5b5oLYYQXLRNHNXohx
	f2n+LQXQ7kBpyiYCF9Qay4NKO0ZqywuNYwiCWF1P5fThM4QnXv1/rovtzcaCx5OOpPbp7UG3lXL1w
	rbrGdiCPIQAivseZtwHb07TXoR9qK9Ifly1DrdK4rrljOeMCxSMBJJJFST8Iw2P0uHUqZVLx06lg5
	JZZnrWJzRX4IopokWHkvN3zBFL4RO5uIEqhCR/3ffJ1pl4BCmVN4DuJPpveLJ+vvgtB820mvFLvGG
	eq59pQtqeX6f7BzNxC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHOk-0000000HMRC-30Iv;
	Mon, 09 Nov 2026 04:54:26 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHOh-0000000HMQ5-07we;
	Mon, 09 Nov 2026 04:54:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794200057; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=MCasi0aAC9bQykT/uLdFVStj0hkr8DzDDISEPG6FQROiPLiTiT0qTGFWVu4S3dsCG2W0sa8JHCrdah56whz0XsrK0vbjHf+QLF0EKaDsK58NpZSYGBN8W+Rio0zq5QaOlXJTr68+gL1iQ2BGfqwZz9I9kO+gS4X1ueYpdguG190=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794200057; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HxOJjxxAA23BtFl1yH0m4TU0F4sP/+f5RvSh1fFL9Xs=; 
	b=CuWLGxie1s5DGDEQTCalGFFmxK0L3ZNj7synKfPmsUjRO9V8aZrzr1q+wX2UokqAwQCqcmZ6IXOHy3IWD2nlMq9kWYXL98rGfqOm0AbOlfFfTk41xSXFr3Jy0VbEzCAA4IJG9DNg9oysGp61GNhkrY5c+XtTJLH1CqgPV8pQcdY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=XW5fo6x3E8JPX8znOqWTAOZ3H4QDP0NRlEwogfmmxYsPl/dDG+DXOD7PgBxvZbN91y9/oL+dZvK4JlNJscXYUrCRVCYBIi8usvKHQs1wPjppTnnWXmohbPw6QC3RmtQvb3i/5LMcIsxEnRUO025ElUgJvX1qiXU8P4RBNwrf5fQ=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=HxOJjxxAA23BtFl1yH0m4TU0F4sP/+f5RvSh1fFL9Xs=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 179420005643772.08283895890384;
	Mon, 9 Nov 2026 05:54:16 +0100 (CET)
Date: Mon, 09 Nov 2026 06:54:15 +0200
From: Igor Velkov <iav@iav.lv>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Enrique Hernández Bello <ehbello@gmail.com>, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com, robh@kernel.org, heiko@sntech.de, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH RFC 0/2] PCI: rockchip-host: Retry training and hot-reset a JMB585 on RK3399
Message-ID: <20261109-rockchip-pcie-tx-swing-result-1@iav.lv>
In-Reply-To: <60fbb95c-63cc-4d22-9e2b-51332a50054d@rock-chips.com>
References: <20261024-rockchip-pcie-resume-v1-0-58e54a5cf5f1@iav.lv> <20261109-rockchip-pcie-deskew-result-1@iav.lv> <60fbb95c-63cc-4d22-9e2b-51332a50054d@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_205423_341887_592E5B2D 
X-CRM114-Status: UNSURE (   6.84  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Shawn,

Thanks, that settles it. Bad bring-ups with TX_SWING_COMP against the default:

  0x4: 10/104 and 7/104, default 3/104 and 6/104
  0xc: 6/104, default 5/104

I did not measure VDD09. I stop looking for the cause here.

Next: I withdraw this RFC. The hot reset in patch 2 does not help: the link
comes back fast and still aborts. I will test a replacement on mainline and
post it as a new series: watch the LTSSM for 5 ms after link-up, and bring the
port up again if it keeps entering Recovery or training timed out outside
Detect. In Armbian that gave 0 aborts in 600 rebinds, against 5 in 150 without
it. Nothing needed from you for now.

Igor

