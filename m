Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3B0606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d9OF7iKQ;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=BXgAcNYY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3MBdZCa3+pc0zEIK6T3rmt1yKKRJeNOUk5g02fXUNZc=; b=d9OF7iKQN1iCyb
	EdFb445WDOoTQR8SSL96zv+ML9gXGo+sEWljMKEcMAgOP/BiMBh7E0VrHp/fzEfEitwsWl/iheJ9X
	s8a/LW18dKb5YVn9Z1sFUBzOH/Pwak0iiiRsbQscqVHF4oBMjJ2qsljzbS0s6zUWrYOz78GtONnDh
	nyoMaps9CB4uknDPiVhdtBvgrAiJbMpik4OGtSE6AAuMnDVpYIXmfnrZ9rnOenIyalS4QmVPNkyt3
	DEjmquxgIx3gPAYhCde75q2z3Qh+ncc1QvXrPizIGDrkVe5786UkR40oGzIZfEnGZoZHR4igRI2DR
	OXmtz+DRNamkKzpX0DGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbHc-000000004PT-1t2b;
	Sun, 15 Nov 2026 14:32:40 +0000
Received: from mailgate01.uberspace.is ([2001:1a50:11:0:c83f:a8ff:fea6:c8da])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbHZ-000000004OR-0lQQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:32:38 +0000
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 9A49160D6D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 15:32:35 +0100 (CET)
Received: (qmail 32341 invoked by uid 990); 15 Nov 2026 14:32:35 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sun, 15 Nov 2026 15:32:35 +0100
Message-ID: <7f2ea700-ddd3-41b9-9500-63a44c321648@lausen.nl>
Date: Sun, 15 Nov 2026 15:32:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Leonard Lausen <leonard@lausen.nl>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable Wi-Fi on the NanoPi M5
To: Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261025205339.14539-2-leonard@lausen.nl>
 <4b7bd146-93fd-41f8-ad3c-88333adc73b4@rock-chips.com>
 <20261026070821.324094-1-leonard@lausen.nl>
 <e028ba53-0c69-4ba6-9b16-8648b8a787b2@rock-chips.com>
Content-Language: en-US
In-Reply-To: <e028ba53-0c69-4ba6-9b16-8648b8a787b2@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: -
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.992814) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -1.582814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=wEW9XVAV0DUg1t10qy3lbNxLg4TAA4TlBE4rFTXyck4=;
	b=BXgAcNYYDk0LWEkWPTYakA9wmgidxf1/hV9wTaYI6vyCuqmEP/scby5qY/cCYeDzXWEZconqiN
	muPFWqC+DU7CNGSzfqcwHPWaObKtp4vQA47ZWJlfrEoh82xWzq8HbgpRXZ8Pyyt4l8eBKh/cSNCg
	C6ntv2511UkbwaQWWt3isuaFuf/iM/UGPidSups3frU2PQgq5r64se6LLRVlx6O9eBuYn5Q3NquI
	E1q/eIprbxbg3mIaibNFL0GlFl7UHqi7P4jnf/Sazb2NXY54NIfBaeqWk3oThwOjACmUBtj/PijK
	PVDGPGylSYucwzjhRFqJhDDROTRDv+cUXgJN8+yjw6tLstrJz05Yldy188qkJcpOMsUTmk0R8PaM
	fg3hrlMu7uc7h7FVj/xTZkGUULMTaWA6PZ/jRVZdQH7iZgTHYfp2vbEM6n/Rrt00DswvMj4zXx41
	VXjRH+hue9HpSJuo7pXv4ukSa8skt0sIvEKCKbShq1zgaZ5LFMcdz2c6KxN+tAjh8ceDM4UjFJB7
	XFHCjNLyH+qRzezA2coUNCd+gdbQv7xl4SvPYy4EbqBVqGmBwjSLS8kV2yiqGxSUNNZLOU0HWtvT
	ya/xwpBJF2Wr7sKWhWyHUgnKTk5P0Vj12+PZA0IlYF8uBBeK5m3+9+VxmumDlgR7EScC44ui9tD3
	8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_063237_363931_88A36531 
X-CRM114-Status: UNSURE (   7.03  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>> The NanoPi M5 has an M.2 E-key slot for SDIO Wi-Fi modules such as the
>> RTL8822CS-based AC200. The SDIO controller is disabled and the module's
>> power sequence is not described, preventing the card from enumerating.
>>
> 
> I suspect RTL8822CS doesn't work as-is, unless you need to apply it[1].
> Please double check it.

Thank you, Shawn Confirmed your series fixes SDR104 and improves the 
wifi throughput. Throughput still stays substantially below the 792 
Mbit/s raw SDIO bandwidth. I prepared a few commits to remove overhead. 
First two are at 
https://lore.kernel.org/linux-wireless/20261115142330.359247-2-leonard@lausen.nl/

