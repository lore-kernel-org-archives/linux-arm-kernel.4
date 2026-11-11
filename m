Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC75606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 04:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NmywYgfQ;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=JxPsOZ/v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3fOO/5TS5MC3uku0IcFyxhEk9H8U26fc9bugwI8TDqQ=; b=NmywYgfQu/GfXj
	Fv8PAITOIiL+ERBCbvcL0CZ+/c+kSw2QkhR1mSBADaGyrYb24GcrVo6IX0QiOrDRMmcI0QPcmvEtp
	j04KALI/FKDXQDU/jOuIxA1cFSuABjP63Mdo+vWzZR5vx2s0T3pYvm1M1q+By/DhP3f6gXetRsiLM
	H5jHrkImG0oP/c1YJ9L0Wy+p5UHg/JpFZks9YZ2pCu5TO6LbA4y6ZZr1JkZ832sOd3FTqysLxE5pg
	eQec3cG2h1CgEHb+gTn6tvkMJGVBPeM1Qy9tN0BpNosqDd61AuvQbEVZY5LfqDUXQkyc9cEiHVbvq
	o0g7npVetH9QLF9bXxog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzjK-00000005ass-31vM;
	Wed, 11 Nov 2026 04:14:38 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzjH-00000005asE-2jis
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 04:14:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BE9410DD7E;
	Wed, 11 Nov 2026 05:14:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794370469;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3fOO/5TS5MC3uku0IcFyxhEk9H8U26fc9bugwI8TDqQ=;
	b=JxPsOZ/vQsc9ChQPwqoKSIBD5HFyAEFCENBUwOk0ggInk+3gfzcC9vvOaMPE6YGYgeaNi8
	qAzCD82Y2LHRuWypQRfr4IoYSxM3zI908pBCG2iTvbwaL8nxnzjWaXmh/QZ1q3eQnm1JAM
	kPMbtrxwzVAc0kA8MJInhvoD0tKuKsbxKKbBae1Icb2vDUrCDwOP7U9eYlNEYqEpK3ZSUL
	PoUw+ypedIEBIMBR/hpjGnhfKSyvy6BaC2usJRXmbYwI3lzdYJH6dVIMtoYFkpH9s5mtvh
	vJ7OU2mhN+HjUKz/BGgMwcY8TXaSrMkc+61x8+ap2s7qzbmckUjahVvIXoTcDg==
Message-ID: <51207e63-ec60-4805-bf6a-b10647ee3866@nabladev.com>
Date: Wed, 11 Nov 2026 03:27:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: mmci: stm32: handle mmc power up
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261030215427.488298-1-marex@nabladev.com>
 <CAPx+jO8sc8gbxNQTjK2tx+1UPLqwwEof3E9vknHNc4kmbeB7oA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <CAPx+jO8sc8gbxNQTjK2tx+1UPLqwwEof3E9vknHNc4kmbeB7oA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_201436_160077_3791F1D0 
X-CRM114-Status: GOOD (  13.78  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 2:32 PM, Ulf Hansson wrote:
> On Fri, Oct 30, 2026 at 10:54 PM Marek Vasut <marex@nabladev.com> wrote:
>>
>> From: Christophe Kerello <christophe.kerello@foss.st.com>
>>
>> Manage MMC POWER UP state like MMC POWER OFF state. In case of low
>> power use cases, it will avoid random initialization timeout. This
>> fixes a failure to switch DDR52 eMMC to 8 bit mode due to -EILSEQ
>> returned from mmc_get_ext_csd() in mmc_compare_ext_csds() called
>> from mmc_select_bus_width() after Standby1 suspend/resume cycle.
>>
>> Fixes: 46b723dd867d ("mmc: mmci: add stm32 sdmmc variant")
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Ulf Hansson <ulfh@kernel.org>
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-mmc@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> ---
>> Marek: Update commit message
>> ---
>>   drivers/mmc/host/mmci_stm32_sdmmc.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
>> index 9dc51859c2e51..659a5040729e9 100644
>> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
>> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
>> @@ -368,7 +368,8 @@ static void mmci_sdmmc_set_pwrreg(struct mmci_host *host, unsigned int pwr)
>>          if (dlyb && dlyb->ops->set_input_ck)
>>                  dlyb->ops->set_input_ck(dlyb);
>>
>> -       if (ios.power_mode == MMC_POWER_OFF) {
>> +       if (ios.power_mode == MMC_POWER_OFF ||
>> +           ios.power_mode == MMC_POWER_UP) {
>>                  /* Only a reset could power-off sdmmc */
>>                  reset_control_assert(host->rst);
>>                  udelay(2);
> 
> What exactly will this reset?
The controller.

