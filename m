Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC1A606A883
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3pP226dr;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=N02D2b3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SB73NSyM9IDD31uAayyVRUqA94r4RoQKPelrn7GTAjE=; b=3pP226drXGYFyv
	n4PMBGt0/Df4Y0BX4MqyUVBJZgVFbB3v/Accm/dCmeAapwaVe0bn2nHFMjaxUe+NYAPSagFK8BgWY
	YV6DXuYXuDFDP+t7RAaw1sc7ImkCca6c+TENskFQEk9JrFZkrzlW/S70nN0Vm6i/SHO38WGGU5QXm
	wAFpzMiTXL4lFJdN+xzacaATGwp/4a2diIitjeaRGhyCN9/NDedBbyAYs4aIODPRdCFyqb9e2egd8
	VuD6wuMN+OvBM72+yHzd7XkU5DMl5b6XswjqX39e1Dv6Mqm3469Y00sanCbAhB+3jj5ME1iMv9uRG
	yT2+8Fh6lyRpOazfHPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAll-0000000FjpT-23ao;
	Sat, 14 Nov 2026 10:14:01 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAli-0000000Fjoj-2yKj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 10:14:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F056D10E988;
	Sat, 14 Nov 2026 11:13:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794651233;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SB73NSyM9IDD31uAayyVRUqA94r4RoQKPelrn7GTAjE=;
	b=N02D2b3beYxmdyVWuxq2DIFbj4k0uds9ayUfn6iXl2pkTt9f+I5uts4pP0PtRM2Q5pk9qz
	hvDoZeJqQ6afVUn8uqnsHnllNg8UjbA0Z+vxzsAmROQbCK5iofs55grgqYk2Qj183Gq03s
	u3Sq0cVX1eDc/f/nwezT3kBi7NTzeEeP3hHy0KaYXORo/CzfxTXGG1PK+/N5mYjwTs4+71
	mjrBr+UCchPV0oyb4RUBdq0y7sjzKU98HFV1VSPMURxSGCxvSKx+WAPgKafkrOhBtTf81t
	y2GYq6ngM7uR2Hy272blLfddU7HYSGRfy61mQm1kc6BOXlQQpf+kh5hv4z3cvQ==
Message-ID: <73cca072-583d-4601-8953-6f2769c6cb19@nabladev.com>
Date: Sat, 14 Nov 2026 02:00:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: mmci: stm32: handle mmc power up
To: Christophe KERELLO <christophe.kerello@foss.st.com>,
 Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ulf Hansson <ulfh@kernel.org>, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20261030215427.488298-1-marex@nabladev.com>
 <CAPx+jO8sc8gbxNQTjK2tx+1UPLqwwEof3E9vknHNc4kmbeB7oA@mail.gmail.com>
 <51207e63-ec60-4805-bf6a-b10647ee3866@nabladev.com>
 <CAPx+jO89Z0Z241L1jyB_3sUygdEwGicqT-WfHc6ppG8egHUO2w@mail.gmail.com>
 <c3cbd7ab-e689-4a9b-b311-af43980738d2@nabladev.com>
 <CAPx+jO8=nVBUuOQ==Q66nOnH+VeXur88DetmETe8qmOiS_NCWQ@mail.gmail.com>
 <e996f9ab-6373-4a27-b5ae-591ba33845c5@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <e996f9ab-6373-4a27-b5ae-591ba33845c5@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_021358_891885_FC896F33 
X-CRM114-Status: GOOD (  15.98  )
X-Spam-Score: -0.6 (/)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 5:53 PM, Christophe KERELLO wrote:
> Hello Ulf,
> 
> On 11/13/26 12:46, Ulf Hansson wrote:
>> On Thu, Nov 12, 2026 at 7:26 AM Marek Vasut <marex@nabladev.com> wrote:
>>> On 11/11/26 12:45 PM, Ulf Hansson wrote:
>>>
>>> Hello Ulf,
>>>
>>>>>>> -       if (ios.power_mode == MMC_POWER_OFF) {
>>>>>>> +       if (ios.power_mode == MMC_POWER_OFF ||
>>>>>>> +           ios.power_mode == MMC_POWER_UP) {
>>>>>>>                    /* Only a reset could power-off sdmmc */
>>>>>>>                    reset_control_assert(host->rst);
>>>>>>>                    udelay(2);
>>>>>> What exactly will this reset?
>>>>> The controller.
>>>> Okay, I see.
>>>>
>>>> In that case, this reset also makes us reset preceding updates to any
>>>> other registers, for example the clock register. I would not recommend
>>>> doing that here, but perhaps there is no better option.
>>> Does that pose a problem in the MMC_POWER_OFF/UP state ? I agree this
>>> would pose a problem in the MMC_POWER_ON state, but here the card is 
>>> not ON.
>> I think it is a problem, yes. If you have a closer look at what
>> happens in mmci_set_ios(), I think you will agree.
>>
>>>> If I may I suggest an alternative solution, perhaps we can manage this
>>>> in the ->runtime_resume() callback instead. If the power_mode ==
>>>> MMC_POWER_OFF, perhaps do this reset there instead? Would that work?
>> Can you try this?
> 
> I have sent a new patch based on your proposal:
> https://lore.kernel.org/linux-mmc/20261113-fix-resume-reset- 
> v1-1-115b3da5764d@foss.st.com/
> 
> It works fine on my side.
> 
> Hi Marek,
> Could you also test it on your board to confirm that it fixes the issue 
> you reported?
This works too, thanks .

