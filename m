Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E98606A685
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 00:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KVNS/f4p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xLiURntbB8itC3uur3jIvo2tuZtCt2Zw/8T/g6JuAqk=; b=KVNS/f4pkmfySQ
	/hYdepe1Xu/J7Cu+jzjQ7+zqPuAQ6QBGYrSYq6wiBP9m6T7QbYO2D1L8f+jiC2TaDU+yhEh3YB1kb
	3ddAEkBV8F7Wzwv92wJ0yyPYobF3wZj+P+duUKXN3h2ix4M8ovammnnV5hMAhZ+4SCP+Jw7FXDgqk
	gFLITZL2I8lczD1HAAClhJ5JJDAjl30h+M0BGKctErHrJ1dSgsjIFlC0ZYP40TaBc2azIFWvohgBD
	2Mhp+J9H6Y9eA+1/R5CrKcu5dIr87GD5nsQrBly4vaWAHq/A98WU3gQZ6XfpretKHA7Lif5ch3gea
	k+cXc+ugCGyj3fGJtkMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIGS-000000021dZ-3hn7;
	Mon, 23 Nov 2026 00:50:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIGQ-000000021dP-47V3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 00:50:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 60A78601C7;
	Mon, 23 Nov 2026 00:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BEC1F000C6;
	Mon, 23 Nov 2026 00:50:29 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] PCI: aspeed: Drop PROBE_PREFER_ASYNCHRONOUS to fix
 enumeration race
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261109-aspeed-pcie-sync-probe-v1-1-71cc9e718623@aspeedtech.com>
References: <20261109-aspeed-pcie-sync-probe-v1-1-71cc9e718623@aspeedtech.com>
Date: Mon, 23 Nov 2026 01:50:25 +0100
Message-Id: <179539502571.13869.8848645925220262755.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1131;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=TUk7JwOeN0q99/GxC4Xg0mmPj1Aqg/FZ9HNmXrA4qOI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrA43Us9oJ7ZXIyO+S+kymUsQwcKiqhJZfXHGKd
 8M8PwVTvwCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawON1AAKCRBVnxHm/pHO
 9SfLB/9nn19XlJtmFtdKt3Vu7v/k9x9HL694oHFSO5sj5JJZvXuf4+QftYrPbGYdsoMmJa5cvpi
 gPRQ/NT+dAdYwWOKaZIsFNu3xu6hfI3wCCXMQIrHtsB/xhFF0kBvt9qmt3Xi+O0jPFqD74cstHq
 oYM1LQe7ZSemE7lvLDS+1ATDY6on8ABshw5qOO6iKJsSHImE6E22d2agTgfrOkGeeS+Gewm3ghT
 GNUriDPaWDHz+98MK4yiok9qWLavrRQYGgV8g8V/B6gv9C1sNRJoedhpUGFI2YhPISBU5jf+0XZ
 jiLlY/FCRJVgQdwJeRVrQNixqNvybgNxzEvq2voAEok6h9jo
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

On 2026-11-09 19:57 +0800, Jacky Chou wrote:
> The ASPEED PCIe RC driver opts in to asynchronous probing via
> PROBE_PREFER_ASYNCHRONOUS. This allows the driver core to probe it
> on a kthread in parallel with other drivers instead of waiting for
> it to finish during the synchronous probe pass.
> 
> On boards where a PCIe endpoint driver is bound early (e.g. built
> into the kernel or probed from an initcall that runs before late_
> initcall), this races against the RC driver: the EP driver can start
> probing before the RC driver has finished enumerating the bus, so the
> EP device is not yet present and the EP driver fails to bind.
> 
> Remove PROBE_PREFER_ASYNCHRONOUS so the RC driver probes
> synchronously again, guaranteeing that bus enumeration completes
> before any downstream EP driver's probe() runs.
> 

I don't understand the problem here. EP drivers will get enumerated only during
bus scan, which depends on the RC driver's pci_host_probe() call.

Are you saying that the PCI devices are created before RC driver probe and
gettting enumerated? Not sure how that can happen.

- Mani


