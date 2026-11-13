Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC63560A6F71
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jx+zqCpT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCi00Yo0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JrLg/6b9RqsXrMXKx+iE2vsv7SoB1VWe2RrESbsV7DU=; b=Jx+zqCpTLe7hiu
	0NajhJsE1mq4K/rfR1bN7+Vr3INpEjUPATnHn3h8TbtnubMyN4fPHwfImYBmA1EMhPq2Di8V3dPZi
	DF4KWbO8vBlMWNgWREABP34lfWhIj6oun2NuiMuVV46wUQzLlB4aS2HxtgHQe/6pgepYS8nAxfD6V
	nnkJwE0IsZpr524QR6oncrXZC2cIJKac1GNVZ1GfxW9rMCS2XuxQFZPZDMx2QHz9upvoxQz7IjJSy
	kC+fgvEU4ChYrKGZK0IwJYiwDF+dwk/D4phUSbj4xq2Amr5SgkFKJxoIGI46wPlg6kPBBUGklb619
	IlHMQd4YOJ+Nk8JmFnGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfJ1-0000000BLm5-2lML;
	Fri, 13 Nov 2026 00:38:15 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIu-0000000BLhC-2hP0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:38:09 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-490f38e9688so253520f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530287; x=1795135087; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JrLg/6b9RqsXrMXKx+iE2vsv7SoB1VWe2RrESbsV7DU=;
        b=yCi00Yo0yqbGMJuEgcdll3Ifd96XYBLhXH2Me7qFryzc/oVZ0bvDDR5n7PPD1btMks
         ZxaljOs08dj9GtzVln2uusy70JoKptzVpOZQJFRPw1HyjRQilOzImoobaidGQE/5eZ5/
         Bc22G18EfGlSvkQBR3+leOjslrUzJfj8OAi0FpBQ3QOZJF+oqjdL5NkyttMaCox8Kt0S
         yBrFlS/JAjzDNtxtUlIXJYIARStPTy8iuZ1ZB2RguskgPVfoDt4W2pN9lS2eDBB92ZdD
         y2CPssuUhoQXN27fbH88e42jc5/5VPW7wbgMcD8sLIoL6oD6AV0IeyCDHAU8ZVzlfs1A
         /VkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530287; x=1795135087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JrLg/6b9RqsXrMXKx+iE2vsv7SoB1VWe2RrESbsV7DU=;
        b=wpxVrvcEt6gibAqimwwhAM6NlVHJ9RmeKyP87P41pyXIPAs9Zdscp7fHUeXxXWi/Rl
         k1RbeAjnsSX+rxhj1AlnJpBq+11cBwUJuPyKZLKBW94bQi+vJ4NMQlNwZRfH1urIYD8U
         JEP9sS5bK1F5GfEyl/5UIIviuQJaDgTNsabFKndz+XE15HAT+HGl5K2gAOB/7JYpzjz7
         +ojniTM1+PHALbSLb+xodFPJuVfPuzZ7zHGcw56SSiBYw+KdsxfQ4EciNkuLCIa1Cd/y
         0KY/yrQHcAbX52tNz4NSTj/nBQ4OIL9gCteLYocEdEqfCXf3jWTPGPTG1EOpRuIK7XE1
         ThtQ==
X-Gm-Message-State: APuU4Z/he/rpuKQCmo46/vVy+k3MlfuzONPiWrAAEE1dR++2ndZ6eDb2
	9yMimAZncVEBFkg4GrdhtrCk20y/G+Yn8yLC3wI049tt+wVeEnzXWMhE
X-Gm-Gg: AYBFou25FjDkcILEUCLVDfoP5ErIedmZZMtdd9rfamTJeTdFVZXzM++JQWvW7MA7FLN
	puRjG06T/YQyiKMfUSMlVmbc8sH5r0170sGtCS+iwA+L1rmhBlGDVZEnBlG942c+7OsvKz19UB0
	NMT88+m9iP7Viy4kA1l6Xv1GlIf+JrM8NddSifQ2JRnJlawrxobj3u7psgBIFjebcDZqLv9gTr2
	jLYnL6RHtf/erpZ1LA/9iXz9T5zVpI6BxRCDEA5ar4lEnAsvy2Y1gtJ+FMKfcrN4Q0v0xRfCgw2
	BhrHpYGsnBQEAStFZGp1fkDgPWawuSeaHxwvJ5iSREswhR21Wt8xw8ImdqGSZhPZEUwfCJVHa4N
	iZGCWdVhox5l5YFydEABedAETGkJSg/KJVTvYOyj9sHaV/c+dHt1+wqqb8qUuAZULLVygjffyvb
	rEW5zvL0DWdHkp54KW48XSLd2w5DhPQeig0xX8gJbOwGbxJ84CFmnvKFwqpFOeFlR2V5obhUvAP
	nO/6wGzmVFJAOP2euF6pRtI6SePY+rSXNIVGtsy4JtKt/E3/hn2Gs8JMf+0CBQkuA6bkKAiV09A
	/uODWyPhSUKw7svWKIP1Lz5AIUZyJnqIh/PjCGBcaNuAYZsk9djyf5Hu4u7pn8Itltq/Rr94teG
	OSf8kDVuzJjbhKFe7QKMzOCImKwexc/yaVrULKEw4uq61MbXGsQjyfrnT6TrCEGMyWwSSORU0DZ
	v+DUqtP/DEjUHeRsmW
X-Received: by 2002:a05:6000:4718:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-49b0287cd7dmr8979495f8f.21.1794530286812;
        Thu, 12 Nov 2026 16:38:06 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223b21sm2410376f8f.2.2026.11.12.16.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:06 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Fri, 13 Nov 2026 00:38:05 +0000
Message-ID: <20261113003805.3669702-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014131954.GA1623979@bhelgaas>
References: <20261014072109.1759502-14-ghahramani.navid@gmail.com> <20261014131954.GA1623979@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163808_709786_B2445B44 
X-CRM114-Status: GOOD (  15.29  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bjorn,

Bjorn Helgaas wrote:
> Suggest making the subject line:
>
>   PCI: zx: Add ...
>
> or whatever tag you plan to use for the family of hardware this driver
> will support over time.  Future changes to a driver typically don't
> include "dwc" because the name of the driver itself is more useful.
>
> I see "zx" used in the spi patch and "zte" used in the clk patch.
> "zte" might be too generic; there may be future hardware that requires
> a different driver.  "zx279128s" might be too specific; there will
> likely be more SoCs that share this driver.  Same consideration
> applies to filename, config symbol, struct and function names, etc.

Thanks. I will use zx for all of them in the PCIe series, so the
subject PCI: zx:, pcie-zx.c, CONFIG_PCIE_ZX, struct zx_pcie and the
zx_pcie_* functions.

> Capitalization of "zx279128s" here (menu item, help text, comment
> below) should probably match the commit log and marketing materials
> for this SoC.

Stefan suggested lower case for these SoC names in a reply, so I will
write zx279128s in the commit log as well and the two will match.

Best regards,
Navid

