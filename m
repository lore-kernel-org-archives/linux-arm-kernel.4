Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F9B606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s/Cokx8J;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=f2E+F7Ui
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N2sxZgU9VMgKrCmPeJoteByBoH/V9b4GoWqupbGXeDI=; b=s/Cokx8JO9T5Qd
	jtWlZWcLKDCLxCxGS/kBI1hI6ebVNhr8F2zWtLSUU4VyyU4X1NQLfcbnW+mNBj4FwX7E+i3c/fqeW
	arpp4ffukip4IrFkizUFcxFogg4vrxmNf5FktT2L0r7+lB3nEyplmkZ1KT+WmT4hd4jqndmS9cPJJ
	QAs5NmWg0gi1oY01+WgGRjIl0kcsishE3ZITq6ss8OtQhQox99c5EEmqw4UW/c0DnMCKmt4ClGxkW
	2ybyBZAolXlI7TWP4K0BxYzk23kuEIA0ZdOZBSLr2VxZt80iNs/J0YX9nhA188QpM4Ifi34GTQcac
	9U7nfKyKkl12QvwL3ytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVvv-0000000AHv4-3HUJ;
	Thu, 12 Nov 2026 14:37:47 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVvt-0000000AHtk-2a6p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=N2sxZgU9VMgKrCmPeJoteByBoH/V9b4GoWqupbGXeDI=; t=1794494265; x=2109854265; 
	b=f2E+F7UiHry6EJ3OD77q4aUNLhVWr7xBZPLwHh52wU13372+IzxTmq026MG3RbV6k0ITZlcqTpr
	D3/YkdXlMskNgu627k7WD5ZXe5wksuy3ps4E5NPru1YRYlHg6hESUx4FDVGliK4K3DgGTpIsqBflw
	/k0EGHXCL1rtfq4RNXMpxgXuy7rKv9jNhmA7E6YrTz9frhzY/efeDQCdA8qTozjQUk6Fz6I0qEOy4
	K3CPopQ9hEj2ZxKF/kaVRmKEiSvDmA9sDNKWaaY5/RVXn8e7RuFtuvqWBpCbuCuc/bK2h/esQoxzL
	IlvXN/tTESaFjcgpoA+4kAjFJUtCH/EcptLA==;
Received: from [177.172.124.218] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xRVvc-009aPf-1X; Thu, 12 Nov 2026 15:37:28 +0100
Message-ID: <e3910a18-dc28-470f-be2f-6a6d568ba7e3@igalia.com>
Date: Thu, 12 Nov 2026 11:37:33 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/15] syscalls: Add an option for offsetting the
 common table
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-9-8d1275885d9c@igalia.com>
 <0cfb4dbf-f3e2-4ceb-ab89-0453ae59793d@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <0cfb4dbf-f3e2-4ceb-ab89-0453ae59793d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_063745_659615_583B6100 
X-CRM114-Status: GOOD (  11.66  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Em 12/11/2026 11:07, Arnd Bergmann escreveu:
> On Thu, Nov 5, 2026, at 21:05, André Almeida wrote:
>> To better support architectures that doesn't share the same syscall
>> numbers, but have them in the same sequence, add an new option to offset
>> the common syscall table numbers by a value. This make it possible to reuse
>> the common syscall table for alpha.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> Changes from v4:
>>   - I was reusing the logic from --offset to apply the --common-offset, but
>>   the logic is different: --offset does a string concat, and --common-offset
>>   does a addition to the number
> 
> I don't understand why this should be different here.
> 
>      Arnd

This how --offset is used, from arch/mips/kernel/syscalls/Makefile:

       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --offset __NR_Linux $< $@

The effect of this is that the string "__NR_Linux +" will be added to 
every syscall number in the unistd header, e.g.:

#define __NR_file_setattr (__NR_Linux + 469)
#define __NR_listns (__NR_Linux + 470)
#define __NR_rseq_slice_yield (__NR_Linux + 471)

...

Now, for --common-offset, from arch/alpha/kernel/syscalls/Makefile:

       cmd_systbl = $(CONFIG_SHELL) $(systbl) \
		   --common-tbl $(systbl_common) --common-offset 110 \
		   --abis $(abis) $< $@

That means that 110 will be added to the syscall number itself:

#define __NR_file_setattr 579
#define __NR_listns 580
#define __NR_rseq_slice_yield 581

So one option does a string concat, the other option really does a sum 
operation. If I had used --offset 110, the result would be

#define __NR_file_setattr (110 + 469)
#define __NR_listns (110 + 470)
#define __NR_rseq_slice_yield (110 + 471)

Thanks!
	André

