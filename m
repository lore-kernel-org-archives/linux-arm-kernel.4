Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C4E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zHJ3CjvQ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OyAaZiii
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G4b3dFHg0tvdbnb4TXJttoG2afJS8WFlVLY+6CDMkE0=; b=zHJ3CjvQVPnSnz
	3baKLQiyA/B6LJkbWW/uJQO1NjGb2NWewmfWxIhcMBJClRik8rmY+ycTv37GuQybb8Q+pdRmQU6vm
	z5jBwLhJcanv3WEhcbwJiRJV5++jwcxS07fvavfzvDkMe1OjFjTrL3o5ksk3RC4J09p9IH5YWJzlz
	rOupEJ6R/LvSr+te61ktUBon9/Z/JfCy6PKFFUOcA+z87vdlymu1eA/DJiL7l88sdar7pVZAtrpMc
	wRuU9d8BTTqhTtNJ4Nz5ZCMuXD1RVL8DShTmwKoBRXCConV04ICESkxHh9HeHU6IoRx54GAhA5zAf
	zEbX9q7G838RsVV8l+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaxH-0000000De9t-3Wy3;
	Thu, 26 Nov 2026 15:00:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaxE-0000000De8w-3j5V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:00:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE5401BA8;
	Thu, 26 Nov 2026 07:00:04 -0800 (PST)
Received: from [10.33.48.93] (GM14V85S.arm.com [10.33.48.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D29A3F86F;
	Thu, 26 Nov 2026 07:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705207; bh=1fcrH9jumeQ+fD04PGZH05Eq8TBEmii97al5gS/oIO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OyAaZiiipunAESQC3EfdqhVnoJcyqbpgBTVTR82YqLGsohLs0r6+TtEzsvhtOg/1V
	 klVLI/kLfeHWDRT8p6tdVY4tnpQp6khQR/B/lQZgzebSw44DDYegyseYf6k9/dZscx
	 sVnxnGqmix/ZMd27GaXlRDnlVtW5LQYVFoNrMxB4=
Message-ID: <91794c90-a797-417d-88c9-8839529660e9@arm.com>
Date: Thu, 26 Nov 2026 15:00:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/24] media: mali-c720: Add hardware identification
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <nayden.kanchev@arm.com>,
 Konstantin Babin <konstantin.babin@arm.com>,
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-5-0cb9bde1bd30@arm.com>
 <179559677600.14607.6594089332845207687.b4-reply@b4>
Content-Language: en-GB
From: Anthony McGivern <anthony.mcgivern@arm.com>
In-Reply-To: <179559677600.14607.6594089332845207687.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070008_969483_BD8A56E4 
X-CRM114-Status: GOOD (  10.83  )
X-Spam-Score: -4.4 (----)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 25/11/2026 08:52, Krzysztof Kozlowski wrote:
> On 2026-11-24 17:07 +0000, Anthony McGivern wrote:
>>  struct mali_c720_top_regs;
>>  struct mali_c720_ctx_mgr_regs;
>>  struct mali_c720_modules_regs;
>> @@ -56,7 +58,8 @@ struct mali_c720_registers {
>>  };
>>  
>>  const struct mali_c720_id_regs *mali_c720_get_id_regs(void);
>> -int mali_c720_get_registers(struct mali_c720_registers *regs);
>> +int mali_c720_get_registers(enum mali_c720_version_id version,
>> +			    struct mali_c720_registers *regs);
> 
> You just added this code. Add complete pieces of code, not half-baked
> which you immediately need to fix/change.
> 

That's valid, initially I separated these changes from register access,
though they are somewhat dependent on one another. For V2 I will squash
this and the register access patch together.

> Best regards,
> Krzysztof
> 

Thanks,
Anthony


