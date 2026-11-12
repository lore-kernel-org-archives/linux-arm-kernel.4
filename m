Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F58606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zdjZ4se5;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=kpMGWRO9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=acMkc7QyDnTSn7Mns6ex97JJ3VU7HnocG3Qg7L3QWME=; b=zdjZ4se5wzQyBZ
	UbijVygD1k+YAFCxqqYL768KLHWn3yeRmRfDv1KreUJLh1VK829GAjmtHxgehSNb64rqQ3KxdTa/U
	EwHLunjXdrVDsQnJU3horYbzusZTnARPqWZ6Dpf4xTaJG8TATMfrQ539II1ciq7Uc/M4gJjEGC3Hn
	z6iBe5s7XxmkqjSwdP+Akv5ZOVeCZgxakUbExznStDDMU+//x1LyGMO0cVqB/xayOkmlqxjkwthij
	45htTQRH4oCEfAXRFSwZd1yFqtRo4e0o4hWOBTZOSpytWU0/XkcMGDyjByDaR3vC4j3zdVJ46nSvg
	MSw0yQyxdNtwGAg025Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWRt-0000000APDM-284f;
	Thu, 12 Nov 2026 15:10:49 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWRq-0000000APCL-3u84
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 15:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=acMkc7QyDnTSn7Mns6ex97JJ3VU7HnocG3Qg7L3QWME=; t=1794496246; x=2109856246; 
	b=kpMGWRO9P6cWNcLEWJNn2KEwjJBNVClCa34I1LtY1NFg3VmVsYir61CkMZ4EIz4Hm8IVdZvtxTK
	l9Yznfj7qDeEkqhFWVjr0Jc9JIquqtRMZs/z2B40f5Z3qJvL/Qk1GW/WcDl6Fzq8e5eiXkordK1LG
	UFobluY/OXWPS4Opc+3jNUfFUTcO3u4/O+r0Q2O41abxPe/3/Qn4zhqIni/2Nc/QzuyKlqCmpeJbF
	XibZpw6PxDLig+nFacrPGS97rxLzSEmdlh0HAuAn69r6UkDIWGdJ4Z42Dvk3sVe8rQP/mKJ3HzF+O
	/rOXEnpNhZoLsZpRSAKbkyje8Shlby+mwnJA==;
Received: from [177.172.124.218] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xRWRi-009bCN-Iw; Thu, 12 Nov 2026 16:10:38 +0100
Message-ID: <ecabf256-3dff-47dc-9e59-8f381c2df4ff@igalia.com>
Date: Thu, 12 Nov 2026 12:10:45 -0300
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
 <e3910a18-dc28-470f-be2f-6a6d568ba7e3@igalia.com>
 <301115f6-3f1e-4e83-bc01-0ba49dec496a@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <301115f6-3f1e-4e83-bc01-0ba49dec496a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_071047_281009_AA414B9F 
X-CRM114-Status: UNSURE (   7.24  )
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



Em 12/11/2026 12:08, Arnd Bergmann escreveu:
> On Thu, Nov 12, 2026, at 15:37, André Almeida wrote:
>> Em 12/11/2026 11:07, Arnd Bergmann escreveu:
>>> On Thu, Nov 5, 2026, at 21:05, André Almeida wrote:
>> So one option does a string concat, the other option really does a sum
>> operation. If I had used --offset 110, the result would be
>>
>> #define __NR_file_setattr (110 + 469)
>> #define __NR_listns (110 + 470)
>> #define __NR_rseq_slice_yield (110 + 471)
> 
> I think for consistency, that would have been fine here, possibly
> using another macro.
> 

Something like:

#define __NR_common_offset 110

#define __NR_file_setattr (__NR_common_offset + 469)

Sounds good?

