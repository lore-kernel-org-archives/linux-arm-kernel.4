Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E266B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mpsRjY5s;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=qjS4jduR;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=GP7oKhu+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xtYY1ni/jPVazlX7rZS6Ml4RefbM5/NVLUrh9nhJs3k=; b=mpsRjY5sGHDTwU
	kDZOSiv4xZLlSDTU6TDRS568XEyho1fBCwnvUBjTOvJ86uZpAisPx1JjoFzDw+KB+HxRwsPtslQS0
	qzZ744Zt+c5MiKLYZh4MafMtQJmlJj7B8zwOgp1tLFDEKZELwg7v567OE9gwIbDGvlUJhO7ofQnaQ
	V+ceuvgUsxrRea11Fcer9bIc5gE+MWNeQ1+qgW05OA4jG5RxeKtHEv92HSNn5BaWMdwgvgNRYMfZ3
	tZoilnFGMOcTwv8EEbO92LeWj/Xw7IrNkhijjlqoPkGtkqZauPeFGcnQk0qC5OZUOHOJKPEQhX8kG
	J1JVMpJfPyqOQL7NLjQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWf3D-0000000EHZT-3u5x;
	Thu, 26 Nov 2026 19:22:35 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWf39-0000000EHXx-3ZTq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795720949; bh=xtYY1ni/jPVazlX7rZS6Ml4RefbM5/NVLUrh9nhJs3k=;
 b=qjS4jduRS4Zsiv6coXPbfaH9e+XGqs4q2ihHhHsrokiBP/26+cKAw1kRFF1eYdMxYg2L7CmCV
 V+/O5skL6qdZQMrQTbyjI/DPEhF7ALt81xgwzs5dgB8y6TKOewsa0iM6idHDw98h/58qnaXY0LY
 JQc93DBMKFLoqKwnVnJnzXwm42AtWmGlTrlxMLi4fLaAZ1lMd7yOxujzncVCoblG8ic9P6lBYrk
 273ZjjyxSM/srPmJTS1TQ0bMDp9iphkgXqtJSuKXeMCFPBcVK/MP1s5lge/HQ7CQYwYy2Ys0Jqf
 81H/t51Tux8lmKfncip440oq/Y4+BemoXsLh+2ndxjjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795720949; bh=xtYY1ni/jPVazlX7rZS6Ml4RefbM5/NVLUrh9nhJs3k=;
 b=GP7oKhu+bpNFB+xObrjHquy2UoP/S7BPfcxDiY+8a6/Ec0KZLOL+2V9Jw2MVZ4Kvx+bZmuzty
 N/GCBt9MoLvDBjCJaOg1MrLPjPuRp4jYPm4R8EK5Hy0rIsEX3rBovGLTLlGklaNeo/Jn5DlnYf6
 YMuliIyIQW2XQNRfWAmMvcw=
CFBL-Feedback-ID: 6b0886f4db90085b74e95c0c:357941f6256b17592609bb13a46c9175
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0886f4db90085b74e95c0c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.39
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <b2e8d547-dd57-4ce4-9019-372d3dc962d7@kwiboo.se>
Date: Thu, 26 Nov 2026 20:22:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add ArmSoM Forge1
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20261122184532.1300004-1-jonas@kwiboo.se>
 <20261122184532.1300004-2-jonas@kwiboo.se>
 <8fc3f505-61bf-4a6b-80f9-1cd6bb1e698a@kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <8fc3f505-61bf-4a6b-80f9-1cd6bb1e698a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_112231_928086_2BAE4AEC 
X-CRM114-Status: GOOD (  10.71  )
X-Spam-Score: -2.0 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

On 11/25/2026 10:45 AM, Krzysztof Kozlowski wrote:
> On 22/11/2026 19:45, Jonas Karlman wrote:
>> ArmSoM Forge1​​ is an industrial-grade product powered by the ​​RK3506J
>> triple-core Cortex-A7 application processor​​. It is specifically designed
>> for industrial gateways, HMIs, PLCs, handheld POS devices, and home
>> appliance display/control applications.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> 
> Malicious characters found in your posting. Dropping.
> 
> Be sure you use standard tools, standard editors and run checkpatch.
> THERE IS NO way standard editor can create zero width space.

Sorry about this, I copied text from ArmSoM webpage into VS Code, and
nano did not show anything special when amending the commit message.

checkpatch do show a warning, however in terminal and editor the line
did not look too long, should have trusted checkpatch :-)

  WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
  #9:
  ArmSoM Forge1​​ is an industrial-grade product powered by the ​​RK3506J

Will send a v2 without zero-width space and have changed my git editor
to vim to help catch anything similar in future.

Regards,
Jonas

> 
> Best regards,
> Krzysztof


