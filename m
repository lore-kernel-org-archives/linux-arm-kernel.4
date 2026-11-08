Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A60606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 23:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pF6l8moM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=U+xl+M8D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r+y8CQ+aNutDnqhoFEXjnp4bJTLJopAbpRetz6dHelc=; b=pF6l8moMXvJkav
	FgVVdo6EHkRrViEp1sMBlAe77Us6oUihKxD58HvLh9QOyM3iJJuJef+sAt0b4/K+GeHO7ayNDHD8L
	jjscTQdzSArLwlDk7IG73+oCFPrK+MNBClTRAMh+Irf1eCagTY3bUClXBVXwbkUdZyQncCR+D+4VP
	gtWlcQ/yPkuNPmAo1Vgyk5TEjZ/MXhifzfwaHiP70/JGgI0QNT5C7qJKCEEMR24PhaJL5//LCxirg
	GLs0IehoOyxy3Wyzjujuyv2WFv4puFtVEN2FWniQFUVX7BMYKJMrZSYKMQYeeoDjmXUG2W8h9EzkE
	d0XIseVCfZF5IPObkOyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBxj-0000000GsMI-2j29;
	Sun, 08 Nov 2026 23:06:11 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBxg-0000000GsLo-3IEj;
	Sun, 08 Nov 2026 23:06:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794179162; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=U+XdoxztM7eUIcyKziLbVWP8OQzzFhPIlMFZhr4hdtPqgrf/9tt4ahY8NuVCXRZODMqUFgKNN1J74C2CY/Ebxl1rscXqEEgrxo/mfKlkj2NFt4gMcuHT5XFKdiPbpAlmV6i3ud6bwMeJic7KGRcIFc2d06qEOX4tKytxtgLvCaw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794179162; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r+y8CQ+aNutDnqhoFEXjnp4bJTLJopAbpRetz6dHelc=; 
	b=WCJkCA7y3/E+eXiLYiRkmsp/A7i7i3XYL+UE0CwJzk3uuBGugLiStR7W/xqD1xJbDpvq8kF0fTXmjv6ipimcYbyHJpVuSOOiOcC8toZ8k9TZXV1bqgZRICpK6dalakePHnQqOyyzEPCnhTuxhCq2nnKOTZnC0owig3AE2hWDrKA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=U+xl+M8D5b6oVRqjnpVsocm0e+FbUMz3SZYXQ88EcUMnerg8h+e3ZrWFG0cxMLFG379cPDnWnUh+gz3gCoyy2/aXj0f9wC015pIgHjYOYnXCr2VXbm20LOzCV8SNSO6ipSFNsw+PmFIoUXA4FqQW9bV82AlJQxy5m5R2vJgMM8w=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=r+y8CQ+aNutDnqhoFEXjnp4bJTLJopAbpRetz6dHelc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794179160553615.2293146265968;
	Mon, 9 Nov 2026 00:06:00 +0100 (CET)
Date: Mon, 09 Nov 2026 01:05:59 +0200
From: Igor Velkov <iav@iav.lv>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Enrique Hernández Bello <ehbello@gmail.com>, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com, robh@kernel.org, heiko@sntech.de, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH RFC 0/2] PCI: rockchip-host: Retry training and hot-reset a JMB585 on RK3399
Message-ID: <20261109-rockchip-pcie-deskew-result-1@iav.lv>
In-Reply-To: <6c9adabe-d632-471e-8fc1-aafe62115167@rock-chips.com>
References: <20261024-rockchip-pcie-resume-v1-0-58e54a5cf5f1@iav.lv> <20261106-rockchip-pcie-ltssm-trace-1@iav.lv> <6c9adabe-d632-471e-8fc1-aafe62115167@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_150609_126225_5AE9C0F0 
X-CRM114-Status: UNSURE (   8.03  )
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

Thanks. Deskew makes no difference. Helios64, x2, bind/unbind, variants
alternating every cycle, bad link bring-ups:

  defaults 6/104, auto deskew off + trim 0xf: 5/104
  defaults 6/104, magnitude off: 6/104

Your mail has the magnitude at 0xb, but TRM V1.3 part 2, 17.6.10.1 has
TX_TERMINATION_TRIM there and DESKEW_MAGNITUDE at 0xc, so I wrote 0xc.

DEBUG_DATA_OUT did show something. With Debug Mux Control (0x208) = 5,
share of samples with in_dllp0_data_valid set, 100 ms window after hot reset:

  good bring-ups 0.16% (99), bad bring-ups 51% (3, range 45-53)

The first training looks the same: 0.15% (97) against 47% (5). mgmt_dllp_error,
crc32_error and in_tlp_error stay 0 in all of them. With the mux at 4,
start_replay, replay timeout and dl_protocol_error stay 0 too.

So in a bad bring-up the RC receives a constant error-free stream of DLLPs.
I read that as the JMB585 repeating flow control init because it does not
get what the RC sends, but this bus does not show the DLLP type. It would put
the fault in the RC to JMB585 direction, on x2 only.

Is there an RC transmitter setting worth trying for that, such as swing or
de-emphasis? If not, I will stop looking for the cause here.

Igor

