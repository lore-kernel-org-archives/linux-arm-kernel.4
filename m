Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A7D606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kDZkxCFP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFoaIo2B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=P8cPmZ6LyhdSdBvBMkhnzumAS8edWkpwK9m1uBz9e0c=; b=kDZkxCFPxV7UNIOmmN0uZKP570
	o8zX9GVoVjgcyQ23qU3HLr6TeA5wxIYiE+/vNEEA1gYdFnv315Q1XSvs/yplI3ypleRJbZneRRHBj
	pNZ1xqgkSpZ9qt63czQEcfL3d5ntAEXbk4Ql9nMlN+gHECL7efDfqWCT8NmCji++i9RDVLHjm5PWv
	P2vOQ4IoyBQAcJ5RLQ7x0j7RhsvbZV+lpGuVTtT25UwSSAXTkcQ4ShFeVHjmrlbTYO769qJWDDlBI
	LqA1Fc+BoBlXWa5iiNVPWlpkj9468R+Flc1FZwlIVgIN76wyCcKxE1jlzLh1WrqNci//1sw4GaBfH
	oQQgqjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQc3-00000000y5R-0bzl;
	Mon, 09 Nov 2026 14:44:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQc1-00000000y4y-25pM;
	Mon, 09 Nov 2026 14:44:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F150042E8E;
	Mon,  9 Nov 2026 14:44:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794235484;
	b=RLwF+j6/d3fXIZ5OYqDFht6mBCBmGylZFd5Bptl3+BGi3ibyhjbg5TP+BpN4dMr2puq6
	 HhUoWDeAumPKxMss5OkypaDzxNHLUZJn3bvEpiTVLo+SoBhBrIYQu0vnvI09wO8YBC7bK
	 dnDnQcwMQtjUxt84AOTo13+NuXexwcAK1Jk173j5RaKL2YTQX30n2Qx+t4S9s+XCggcBC
	 F1IBOAPGWspE8KFDROQ0sLC0JaVtSte7XHNNWyRwidcPRJxkgLcebFk8+zFFtENcxoRCc
	 f4g8xhki5W778hNy/ZahyPVZYldiUFUG/Xx78MdSSDd8DewdlOoxlJ7nUJ3NCdMSFiA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794235484;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=P8cPmZ6LyhdSdBvBMkhnzumAS8edWkpwK9m1uBz9e0c=;
	b=ow9ufE4f+MExdCiGV6xzPYwzY2BXq9Xr5df+iSK9bGFchWTt7V6YqH/CxhJIxKx0r740
	 H8kKIfh4l5WHVkvd+zG8pHcryT3to3TD6F0/HFEDS0iyk+qcUImEFsJfm6/sR6DY0eHqL
	 4Y0inITO0Uc6NwpDS1rIiclXy9+kPzg0LLomgfj7VuCpMJ79iLf7ELznsY+m558PHMnHJ
	 agMw1dFG9hRrb6g2QEKUZ1x8GBmK1T5kMCDa8wlMHX4omlFCIoKIrgQSinivwbnzScZBB
	 60p8TEOFdoAdxrwr6JmH5fNkmhDSy+SrhVNfc2XFAqFA7Avvjb3qcgZi/qnY1KpGRRw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9AB81F008A2;
	Mon,  9 Nov 2026 14:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794235484;
	bh=P8cPmZ6LyhdSdBvBMkhnzumAS8edWkpwK9m1uBz9e0c=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=XFoaIo2BLRg3Y4uCpy7NLTkL3B21kvsKP7q2kYfqJYX26C9KrJqRHwmkG5tam/zgj
	 BoCCIEKOuxOUYEDy0SVQCBTYHVNGMKiI6iynEBVdO7qqSGk8M2bk0wYBc0eoqK7tgW
	 5ngw5U+mcn56KopIXFvMAHBhV+PskFCJSya0q9f3Hca4lqaJyPh+XsxJmpi/nrokri
	 sryjIWI8Y5XZ2MRocQYmgL5FlQeOjaYVbkto/ZZ10bOxGNe/uLcYZUXqcEI7VtGwqZ
	 zgefmPMnUuk92M6+RHXNijlMiGLvM+y5elXClGVOOtm0xKLzzlKoGrNx3tbUh1ZQMu
	 ZOCclvbdbqy6A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 35482484FD;
	Mon,  9 Nov 2026 14:44:43 +0000 (UTC)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD_via_B4_Relay?= <devnull+cleverline1mc.gmail.com@kernel.org>
Subject: [PATCH 0/2] serial: 8250_dw: Fix RX trigger levels for 64-byte
 FIFOs
Date: Mon, 09 Nov 2026 15:40:58 +0100
Message-Id: <20261109-8250-select-u6-64bit-v1-0-04bc8332fa34@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHrb8WoC/yXMTQqDQAxA4atI1g1kRp2pvYp04U/USNEy0SKId
 3esy2/x3g7KQVjhlewQ+Ccq8xRhHgk0QzX1jNJGgyXrDKWET5sTKn+4WXB16LJaFvTeeDZVUZB
 NIabfwJ1s/235vq1rPcbmesFxnGmESPp4AAAA
X-Change-ID: 20261030-8250-select-u6-64bit-7717e1a99023
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>, 
 Miroslav Ondra <ondra@faster.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794235482; l=4142;
 i=cleverline1mc@gmail.com; s=20241112; h=from:subject:message-id;
 bh=j7wsNWKLOu8PU6y8Iijjhk75JExmK+N8BPwkouuO6/4=;
 b=j33Bj/JLEw5tU/jtXgoDEE6XPG5xL5NLdO5eBUw/pzIKsWldf4BLZxfpNUT2XARmmBnE29HHP
 iwu6BkgbdpjAHPQHQs8PwHl9YcEADD/JNz4ILRDb4PAW+fpU5fqG1d4
X-Developer-Key: i=cleverline1mc@gmail.com; a=ed25519;
 pk=EJoEbw03UiRORQuCiEyNA8gH1Q6fIpEWnn/MyaWOWX0=
X-Endpoint-Received: by B4 Relay for cleverline1mc@gmail.com/20241112 with
 auth_id=275
X-Original-From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: cleverline1mc@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DesignWare UARTs that report their FIFO through the CPR register are
always registered as PORT_16550A. For a 64-byte FIFO, as found on the
Rockchip RK3328, the rx_trig_bytes sysfs attribute therefore uses the
16-byte table: it reports 8 bytes while the hardware triggers at 32,
and writing it programs a different level than requested.

Generic autoconfig already classifies a 16550A with a 64-byte FIFO as
PORT_U6_16550A. DesignWare ports without a usable CPR are probed this
way, so the same 64-byte core is registered as U6_16550A or as 16550A
depending on whether its CPR can be read. This series makes the CPR
path pick U6_16550A as well, after first giving PORT_U6_16550A an
rxtrig_bytes table that matches the DesignWare FCR RT encoding.

Patch 1 adds the table to the core. It has to come first: without it,
patch 2 would make the rx_trig_bytes attribute disappear on the
affected ports.

Patch 2 switches 8250_dw to the new type for 64-byte FIFOs.

Things worth reviewing:

- The register programming does not change. FIFO size, TX load size and
  capabilities still come from CPR, and both types use the same default
  FCR value.

- The port type visible to userspace changes from 16550A (4) to
  U6_16550A (19) for these ports, in TIOCGSERIAL, /proc/tty/driver/serial
  and the boot log.

- dw8250_setup_port() is also used by 8250_lpss, so Intel LPSS UARTs with
  a 64-byte FIFO are affected the same way. I could not test on LPSS
  hardware.

- Ports detected as U6_16550A by autoconfig gain the rx_trig_bytes
  attribute. Its highest level, FIFO size - 2, follows the DesignWare
  encoding and may not match non-DesignWare hardware detected this way.

- Only 64-byte FIFOs are handled. DesignWare FIFOs of other depths keep
  using the 16-byte table. Deriving the levels from the FIFO size would
  cover them as well, but needs a new hook in the core. I am happy to go
  that way instead if it is preferred.

Testing:

Tested on a Unipi G110 controller with a Rockchip RK3328, on ttyS1 and
ttyS2, with next-20261029 and with 6.12.114-cip34, each without and
with this series. Both ports have a 64-byte FIFO, and both kernels and
both ports gave identical results.

With the UART in internal loopback at 9600 baud, each value was written
to rx_trig_bytes and 640 bytes were sent. The largest chunk delivered
to userspace shows the trigger level the hardware actually used:

                 without series         with series
  written        reads   hw level       reads   hw level
  1              1       1              1       1
  4              4       16             1       1
  8              8       32             1       1
  16             14      62             16      16
  32             14      62             32      32
  62             14      62             62      62

Without the series the ports register as 16550A and rx_trig_bytes
reports 8 by default, while the default FCR value is the one written
for 8 above, i.e. 32 bytes. With the series they register as
U6_16550A and report 32. Values in between round down to the nearest
level, for example 31 reads back as 16, 40 as 32 and 255 as 62. At
level 62 the TX-empty interrupt also drains the RX FIFO, so 2-byte
chunks appear between the 62-byte ones.

The series was also build-tested with W=1 for arm64 defconfig and for
an x86_64 config with 8250_lpss, at each patch. It was not tested on
Intel LPSS hardware.

The commit messages and this cover letter were drafted with help
from an AI assistant. The changes are used in downstream Unipi kernel.

Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
Kryštof Černý (2):
      serial: 8250: Add RX trigger levels for U6_16550A
      serial: 8250_dw: Select U6_16550A for 64-byte FIFO

 drivers/tty/serial/8250/8250_dwlib.c | 2 +-
 drivers/tty/serial/8250/8250_port.c  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20261030-8250-select-u6-64bit-7717e1a99023

Best regards,
--  
Kryštof Černý <cleverline1mc@gmail.com>



