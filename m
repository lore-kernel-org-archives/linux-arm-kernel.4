Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A18606ABAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qziobrfa;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=EF7PKa36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GovTyvydkVkQrCGZJ5TyYvPpzcYH6KA5p9NlJ4kAQIs=; b=QziobrfaemM59V
	1sSTmFNfgb0jv+PEC+0UsJtGhHPqmQyxhSnlzcdRwOVDrHduvvcXzUe7ZaF6LrxPTh14c8pWiLsrq
	ykT6uxckvi+VTgm4ogrTZRATDR3RZJYjYUp+M+vBcfF7OS4QWbCV6XaxIc01kYtuC8fbXpVsIMz81
	IblfR9DI7ALQevuGNVvuOiD9eNtXutSUScfINU97CQyL948tfE8YIalrZXfQ+EcOWdSI/8gb3rsZe
	OHtbsv4D1k5yIwgUVuD3YU2QQbwT49dmbTnPoG/8LVwJ8TbwZH+Dm6dni8xyt5VEtz4HosuMTmF06
	Krw4cuOJ2oTbfD40NX3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrM0-0000000CxXH-0P9b;
	Fri, 13 Nov 2026 13:30:08 +0000
Received: from out-123.mta0.migadu.com ([2001:41d0:1004:224b::7b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrLg-0000000CxOB-3F0M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:29:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=fhhvaKaF0+C06GIQnzgQPEoqdFIJSGlkTUn8H9rIHNM=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794576585; v=1; x=1795181385;
 b=EF7PKa362tPelz+tq20jjG0cOKYDPORaPArw2Fnjk5ikOOMtb2dzeZMA/a1ptUQIHGaJ1vJ8
 t6sScc/UVWYjZUekicRdLPqrU/6MrRdIAlmiS++CkDQzo+OegB9j698qLjL6/8HhrPS4xdjRRgc
 Ydj6hcP+qpzoLb5CyYqy4xhzA0V6mrYEcOpmIYz0rCAyoLuHvun3LXnStuRIWrj+CN8lfU+jUAI
 aLcHvT451J5hyN7C0cIIWb+EwN39Z8CJRzVl7cKKYPLbruwP4YmKXpE3sFvdU+Mfi14PMzLdbyp
 td6nrRqW8dCPu43k6aQk5pQdoJKmDe+Kcf2ILknQOy2Qw==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0231a53ba74ca531;
	Fri, 13 Nov 2026 13:29:44 +0000
X-Mizu-Trace-ID: 0231a53ba74ca531
X-Migadu-Flow: FLOW_OUT
Message-ID: <f354e6b0-c4ce-44f0-b315-60895e90ec3d@packett.cool>
Date: Fri, 13 Nov 2026 10:29:36 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add
 skip-suspend-mode-switch property
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Reza Kurniawan <imkyufie@gmail.com>, Sudeep Holla <sudeep.holla@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
 <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_052949_224311_00BE6CBC 
X-CRM114-Status: GOOD (  15.65  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/13/26 10:09 AM, Ulf Hansson wrote:
> + Sudeep
>
> On Thu, Oct 22, 2026 at 11:41 AM Reza Kurniawan <imkyufie@gmail.com> wrote:
>> From: Alejandro Tafalla <atafalla@dnyon.com>
>>
>> On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
>> that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
>> call is rejected with NOT_SUPPORTED.
>>
>> PSCI provides no call to read back the current suspend mode, so the OS
>> cannot tell which mode the firmware is operating in or why the switch
>> is rejected.
>>
>> Add an optional flag that tells the OS not to issue
>> PSCI_SET_SUSPEND_MODE on such firmware.
> I think it would be nice to further clarify what's going on in the
> PSCI FW. If I understand correctly, the only supported mode is the
> PSCI OS-initiated mode, hence it's always running in this mode, right?
>
> This is clearly a violation of the PSCI spec - and I guess updating
> the FW isn't possible at this late state, or is it?
>
> [..]

Updating low-level FW in retail devices just doesn't happen, sadly. 
Can't be done by the user, IIUC not even if Qualcomm wanted to help out, 
because firmware is signed by the OEM and won't load w/o that signature.

And OEMs, well.. we can't even get the vendors for modern high-end 
laptops to pull important bug fixes from Qcom.. Thinkpad X13s still 
requires that stupid arm64.nopauth workaround, retail Hamoa laptops all 
struggle with the DC ZVA crash/reset 
(https://github.com/icecream95/x1e-crash) that no one from the Qcom 
IoT/Linux world has ever encountered because of different firmware 
apparently, and so on..

MSM8917/MSM8937 are found in decade old low-end mobile e-waste, only 
could be updated by force if someone finds a bug in firmware secure boot :)


Thanks,
~val


